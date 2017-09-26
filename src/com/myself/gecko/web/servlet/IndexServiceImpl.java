package com.myself.gecko.web.servlet;

import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;

public class IndexServiceImpl implements IIndexService {

	@Override
	public Set getSet(User user) throws Exception {
		@SuppressWarnings("all") // 创建根据时间排序的TreeSet集合
		TreeSet set = new TreeSet<>(new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				try {
					Method method1 = o1.getClass().getMethod("getDate");
					Method method2 = o2.getClass().getMethod("getDate");
					Date d1 = (Date) method1.invoke(o1);
					Date d2 = (Date) method2.invoke(o2);
					return d1.compareTo(d2);
				} catch (Exception e) {
					e.printStackTrace();
					return 0;
				}
			}
		});

		
		return null;
	}

}

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563458;
	b=yoew/s2uWLllE5XzPOoNzEAYJ+NZ27vEVRMQZDbIMQZV6FdUfLVpNhXHvytX5dvZxTl4
	 Jd2AYcH967UDlVKNb5qDo1y64B2JzV3N4Mi8m1f0niFBkTv1ig2KR3UtbLxPDFdqsd2EI
	 fmc8hyniRyr85E+BVJHYhy5tQTEgLvhrdENh3YGouvYbSk1JVrv7DDKF/mKTsDWc6ERtl
	 ZjReRHlZirbnvt8l8VHx9WEmXzgudKjSdSXXgMIPUOxV05RuIbjuPQhzGGrsgpNL80/dz
	 n7OxJ/iRUJREtKYs8pg6hvgdY+cY7NdnTzY/dws6vzMr48ruua40av6IZOeyh3DXG+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
	b=ckYFwrudIK2TdY3JEedkJz89omyoVheHGJlfxpDmPZrknKlHq7qJ8e8FtTpDPKX/YQeC
	 G2/j29tTOHLNYAsk3Rr8WrJp2Jej4bBJR7lbtr8ZspDAB2a3mygJZgBmefvOeoj9QBf/n
	 iIYPEllR2JEjGBj7J4L+9dBoTV6744NlmwCASIMgV+uKO1HHAK/r+51vwJRVQPnAtihwk
	 EWZws675p74ihjXnKw6LGkJSTmdYrhMX3+AHhPYMk0xCtLk0dnpBnNVi7tRQFZXmAhERO
	 LKPgi9zFWzHxnLeJmjr8HAWjZ6mFSf6Ffk9nsIewo4rGEdOpCNbyB6vl+E44cm8f0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WxZ3Rjm5;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B54606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 06:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WxZ3Rjm5
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so253689f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 23:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563456; x=1793168256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
        b=WxZ3Rjm5RUkWN83CbketVLkNBPVsdvWlFk+CwaCBibZzVBsgUPTduWqewuQbOArKtz
         9vE6VCziyX0+lo8lF83RuZNlelYea6lTsdzv8SWeLNGqs3MkfzRQMqkCgFRrbCBsdtxP
         bzpn+MxtJ7FR7LnzGa0p5E5fvzzOvF4M/f78cyxXuQkpyn8+Zhzc2auAeSjQPBTTUFJw
         DSFg8Hjqyx9ZPLhLzOgjxzTjbrqmlW2SrDBbsBSlNGbAUfkeq+c02ZFXkTPhsEYpBM3I
         nmehw2sTs7Uc2xNX8CwRWXw5l+FZ5jLB0AQdQKp4YwW49s3UAUs2xsZTdUIm+RbgMEza
         +rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563456; x=1793168256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
        b=ontNtXbpN0AGN6wBeIDNyHRqK7K//A2DVE0EGfqzcts4tJO1Q7UIcpzHrXFS/iykhB
         /ZhbGv+JL18i7iG0qvSl3OrSCUI6QzX4mSJhGdiSznWLCbqBSQaTr0lSyYCYxVJnLSys
         IJk65JgXYsMkaxCUeED+U3jkVeUkfo2JbYRzBZZ29TEDTRsj/ezY1lp03pKwmgYjFdOL
         6VYoSwItqhU2SBmXQqSrBAWHJZKeypDTtF1OpDWRR9+dsBaUxMQiik1cTR6OEK+u/D95
         91oPulhcyc89Fyp6y5J1z4uQMrV05jqHteXPSW/gCJidSXkfUURMlutGNnFzNgEgOq0k
         Gz7A==
X-Forwarded-Encrypted: i=1; AKwUvBx4jnfjaOLI3KSkbDLQaVDzC3F3Z1rcLtfqFSqmWYHVfDAED34APuU4gWFbl4qNBrG5vHp64ZM1iLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOUM321x6RR1BCnEbrNHpphipKbvgPNHp50+Pdq81F6u5stpjw
	8hRremsIiuHfOSGitemNi46WSMBWeMcbM0PTazqgoTJJhfrGigRIlSoR
X-Gm-Gg: AYBFou2n+AbgcCqcaIcB8l3T8UtilkNEs8P6FXWkpe9RHY8MvuxikGTTN4lCNbljEf6
	9d1bKzG8p0vskHau5evv8pvok3lY4QKgvG0VTaLZKNDM/akk0fw0Tlv0vnT15kPANo64iUl0+DU
	d0yti1Ts5ly3jQkSM1dBXtQoaWUQO/dsKPytGjyxy4cAl2F8BcXxnONhaHeeNhYoojCPyXobzGq
	zH9ESbFUurBHEgKE35gMkzHd7tR8weCYBtKBneZdezv5TmTM3plkg5PEHWAfp+DczFh5wF0OZUH
	k5U8gOyzXTnA7fIvCpEQgK7mre3/Q70KmUYlao2+oOZxXTFUJbbrC/OlzaCO1et4BOof6tlZExo
	zfG0WV0L/Fl153amu3MYAjjvwicRik6EOSJBlwyvZQio6dwl3AIok7JHNtdAp69ElRaYM30ZVwj
	ZbhocDKwMBWnDHB9RIpkbBu88j81nR/PltIUb6WRG2rZnCRvKdHJLovyxnlI/rRKGlIB966hitY
	GVotg1NVH/ZxLqOHA/G5v3dsxXXZYjF2bZNUZyPPvx9d3IlUm90g0raEHoqiw==
X-Received: by 2002:a05:6000:2086:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-48e2642cf54mr1849014f8f.5.1792563456309;
        Tue, 20 Oct 2026 23:17:36 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm3663876f8f.42.2026.10.20.23.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:17:35 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	aichao@kylinos.cn,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	Neill Kapron <nkapron@google.com>,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] usb: gadget: u_serial: pin ports while TTYs are installed
Date: Wed, 21 Oct 2026 08:17:34 +0200
Message-ID: <20261021061734.3972101-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org>
References: 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krystian,

I sent a narrower fix for the same problem [1]. This patch also covers
the two holes Sashiko found in mine, so I will withdraw it.

Tested in QEMU with dummy_hcd on usb-next with KASAN and lockdep, and on
a Colibri VF50 on 7.2-rc1, with delays injected into gs_open() and
gs_close(). Without the patch, freeing the line during a close gives a
use-after-free, and a close after a failed open a NULL deref. With it
there are no reports, also over 40 add/remove cycles against
concurrent opens.

Tested-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Two notes:

1. Since Johan's 8df07fe93573 ("tty: fix saved termios reset race"),
   registration no longer frees the saved termios for u_serial, so that
   reason in the commit message is out of date. Publishing the port
   after registration is still right.

2. The NULL checks in gs_open() and gs_close() cannot trigger, since
   gs_install() fails first. The gs_close() one is what Brian Ellis' v4
   [2] adds, and this patch makes that one unnecessary.

[1] https://lore.kernel.org/linux-usb/20261019085855.3259716-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-usb/20261013-u_serial-gs-close-null-v4-1-9ea038501994@gotenna.com/

Thanks,
Mehmet

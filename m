Received: from smtpfallback03.a1.net (smtpfallback03.a1.net [194.48.128.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B5A5678CC
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.48.128.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194226; cv=none; b=XBFV23ehCSgEWic5G0dESV//K9IIFwkK0ioQ17SjhQeHx/kOE7xk7mOuhYWF74ocnMxewvqY4+7ct0SrNi7pLtVcZ4ovwkYELEgWTV0+Zgs/E7lyarhL/DMUrsydQ52RUn6HLBiUCI7c/bPA9ZAe4Z3zFoWfT21X3Dn/eQzGAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194226; c=relaxed/simple;
	bh=aTzyiAm0K216IRXb1PLOrhQ4O00M/TLZKEmePhPhj6s=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Lqjp6HgOvP6JJocrYTwW4nxKpvL0Z0tco0y4K4b+OYhF85VGhF3VZj0T41CBMrv2CjOycA1JmbJXla9OivErDsGZW7obqRti7QSJJ65WEhdrbI7FiudyZfdKSC6ut0Z3rAut5r4x6Rcz7MIKTDPlKaEgRpsG/D7fC0lRtDNvk6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=oxHfZq4r; arc=none smtp.client-ip=194.48.128.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="oxHfZq4r"
Received: from smtpout05.a1.net (unknown [10.247.84.27])
	by smtpfallback03.a1.net (Postfix) with ESMTPS id 4hqntV1RhBzYkmdl
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 22:02:10 +0200 (CEST)
Received: from [192.168.0.6] (unknown [100.78.19.185])
	by smtpout05.a1.net (Postfix) with ESMTPSA id 4hqntJ1XTvzGrqnn
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 22:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790193720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTzyiAm0K216IRXb1PLOrhQ4O00M/TLZKEmePhPhj6s=;
	b=oxHfZq4r8OOd6UyecEmwRDauUeiCOHFOfh/p90HUzYSwLGZligv3lmdeBYX1fz/Pe6ic1/
	6kPxw9okADZDMFSi/1EPQ+VvaoihHFyBisHoLL2cRdBVbX20r0+H5ruzgU5q3ALlehTMPP
	p57tSC+LcStcTLbd1g9+bJZnCbX+FG8av337pWyUUddDYTDkXu5TDrZMny1bWce/F02Zdt
	S8FM1jkhV8ryOZq5LN8A3QQqwOse0rFdFVzvKTHGrOK/L2iCC//pYWdzjByWcY+m/BnM2L
	zAQU1h1qmNvqPrIeozsC6euVc7Q2iS8kRcDRayxv8/utAn42O96w7ZQpsEYZK55KTN12Xs
	z5XAKEBvfq7jIe4sUYPPbE9yUc9+9iVOzPkHfGCvtwF/SOloJuDi4depyKlRqa5GKPxhVZ
	+cf6w/Rb9UITsdvEF8mGKXBYoTnnVgxusloDPPasX1J4TwOq/+4osfk8nwXDQPrbiL5nAv
	i2GkvYi8Li6DXkHaLImJeBWTaIQlaumfyjDBqU6K286G7G/y9GYBt4d3WFUYKC+AorT6xQ
	UpdPqgq6IybvT6pfjyZV61bKalVtE4rbLm2NB3BQpy0Z7RRoNN+fTDswDWA8zOJ4Q6biJL
	Okk06q66JICNQ6CG7subHsYE3LuUdUj9vswP/1b8JDRB/ATzdPR7U=
Subject: Re: possible regression in usb-storage?
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
Date: Wed, 23 Sep 2026 22:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 

I managed to get a usbmon trace for the device. (no uas. 6.9.9 kernel):

> c6f9c900 1170412013 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> c6f9c900 1170412180 C Ci:1:007:0 0 18 = 12011002 00000040 c20b3920 01190102 0301
> c6f9c900 1170412186 S Ci:1:007:0 s 80 06 0f00 0000 0005 5 <
> c6f9c900 1170412430 C Ci:1:007:0 0 5 = 050f1600 02
> c6f9c900 1170412434 S Ci:1:007:0 s 80 06 0f00 0000 0016 22 <
> c6f9c900 1170412679 C Ci:1:007:0 0 22 = 050f1600 02071002 0e0f0000 0a100300 0e00010a 2000
> c6f9c900 1170412687 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> c6f9c900 1170412929 C Ci:1:007:0 0 9 = 09025500 01010080 fa
> c6f9c900 1170412933 S Ci:1:007:0 s 80 06 0200 0000 0055 85 <
> c6f9c900 1170413180 C Ci:1:007:0 0 85 = 09025500 01010080 fa090400 00020806 50000705 81020002 00070502 02000200
> c6f9cb80 1170413187 S Ci:1:007:0 s 80 06 0300 0000 00ff 255 <
> c6f9cb80 1170413430 C Ci:1:007:0 0 4 = 04030904
> c6f9cb80 1170413434 S Ci:1:007:0 s 80 06 0302 0409 00ff 255 <
> c6f9cb80 1170413679 C Ci:1:007:0 0 26 = 1a034500 78007000 61006e00 73006900 6f006e00 20005300 5700
> c6f9cb80 1170413684 S Ci:1:007:0 s 80 06 0301 0409 00ff 255 <
> c6f9cb80 1170413930 C Ci:1:007:0 0 16 = 10035300 65006100 67006100 74006500
> c6f9cb80 1170413934 S Ci:1:007:0 s 80 06 0303 0409 00ff 255 <
> c6f9cb80 1170414180 C Ci:1:007:0 0 34 = 22033000 30003000 30003000 30003000 30004e00 41004300 44003200 35003600
> c6f9c700 1170414344 S Co:1:007:0 s 00 09 0001 0000 0000 0
> c6f9c700 1170414555 C Co:1:007:0 0 0
> c6f9c300 1171416007 S Ci:1:007:0 s a1 fe 0000 0000 0001 1 <
> c6f9c300 1171416088 C Ci:1:007:0 0 1 = 00
> c6f9c300 1171416152 S Bo:1:007:2 -115 31 = 55534243 01000000 24000000 80000612 00000024 00000000 00000000 000000
> c6f9c300 1171416213 C Bo:1:007:2 0 31 >
> cd1e5480 1171416219 S Bi:1:007:1 -115 36 <
> cd1e5480 1171416337 C Bi:1:007:1 0 36 = 00000612 5f002000 53656167 61746520 45787061 6e73696f 6e205357 20202020
> c6f9c300 1171416342 S Bi:1:007:1 -115 13 <
> c6f9c300 1171416462 C Bi:1:007:1 0 13 = 55534253 01000000 00000000 00
> c6f9c300 1171416492 S Bo:1:007:2 -115 31 = 55534243 02000000 64000000 80000612 00000064 00000000 00000000 000000
> c6f9c300 1171416587 C Bo:1:007:2 0 31 >
> cd1e5480 1171416591 S Bi:1:007:1 -115 100 <
> cd1e5480 1171416712 C Bi:1:007:1 0 100 = 00000612 5f002000 53656167 61746520 45787061 6e73696f 6e205357 20202020
> c6f9c300 1171416716 S Bi:1:007:1 -115 13 <
> c6f9c300 1171416837 C Bi:1:007:1 0 13 = 55534253 02000000 00000000 00
> c6f9c300 1171417312 S Bo:1:007:2 -115 31 = 55534243 03000000 00000000 00000600 00000000 00000000 00000000 000000
> c6f9c300 1171417339 C Bo:1:007:2 0 31 >
> c6f9c300 1171417347 S Bi:1:007:1 -115 13 <
> c6f9c300 1174819198 C Bi:1:007:1 -108 0


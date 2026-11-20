Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174469;
	b=DUs1Mr25ed/4ENZ8j332M39tqsvdj2VvDAjycmHsJjvct4YqZ8KZ6xOg2oyTyzn1mEDQ
	 MBCnh6uehnBdYddm6B07zWrlx/qz1DaM+evri0KLB32Rg+yMuX1qB/rHM3149BoyMAGy+
	 neGAuAopEunZJnxm24YqFdSxKws9W+UczBZQKECSVPz1RpRgI6m9jJgZNFrG3CHcgX9Ex
	 41YIBtmSZvtQFpSWWyt8h3pqfqyDtri14aK7NVObvnQZyFpE1MA33j5v3yXy3biZQD2qU
	 VxU7EWPMdYVD1VDJw7RtmT9xCcWcny6V4162pKFgaGOhic+ntd1AaJWsJe8bfkDk8jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=iZg/Q2TlNyv6sCpRSET+iLq7B9YGOb20tvJenB/6ho/+UG/oIzgo93BaqU4u+pzgnKus
	 5GwbCz+E5T/GgtLb7ZaugStloyaiSBuIZBA94xIcZk1MSgi0nZsvlNJ7AhoEjPRgmJMOZ
	 0g+LLF5f/EYHm9lmAVziY3Y/krRoBWfAbCXqJT1wRG2a+MCBLayPwkKbsnVVMe8Ndwnav
	 sJKXE8VZLDkwH2LNVOc2XVd0P2j0HpXcQUNCxaUw69gaKDg6huvtO7xipG0EfeIBla/Hb
	 JU1/1xV3FtOfcoAU08MzfBClRxJRRV0qBon/oBoRRu34CaYZo/cuXhBGK6liTBl294A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JEjh0Mo2;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2E606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F2E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JEjh0Mo2
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f020d0169eso3901925ad.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174468; x=1795779268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=JEjh0Mo2J0GsDfI03WQPh3umBFOzvFjidFR4Q0F/wRq9gw/lREToR6fv6Ed1SmdVjq
         aIaEGXVO5lH71Uhn+sO7s6PbFMOtP7Ph7MY9NT7YHhni5hO6FdDjR3w8vAvXaEGjxshl
         fCz73IBjqrqbz5Aybo/TpNzG4g6zEvGv4oFLSIw1ddfVNEDOX9qQH0/BUT+Y63pFiZND
         YKAPIYRCSmjIA5MXwFMY6sXc4yhQaJSzTxx02/hQHNPfI6jmBzWf3OUBrrIfYmYuSajW
         cYZf5O2ySA7exWa0uL2I8uss4OWF2FE9uSn9wl5N6FxDQJNtQYhYC8ve6bTTxQZIzm5q
         PhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174468; x=1795779268;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=cki6vOyLznuK7ra0Ckrjez4WMvM1JpiFd0AG6MDCHhKQCcBTzMdcP1KJLJ9A+MmgGP
         wyCxtVvhRxRwPqPMIXpPpkBYyy3TthUrQrszqsv1YNkfv1RgiC5Jua+IeIDqK0m0Em3M
         msFwemQf0TxjI4Dq2ZDYJaaxenw6pRF2c5drtj6SVdYeMbzDbSyBVKwCtiP4vesv3poN
         GLRzeWGZbpAKgWty5yvXwO+rQlH6zCAjS3gK22DaLetRBgyiIStnUbDRjMThPWU1DgiB
         Gx0xabre/vQJn5nZPXwSSJgQYz7AwZmX4waM5vlD2fb7XNg2CuQo+sL1bsbxxznlZnph
         nDYA==
X-Gm-Message-State: APuU4Z9t1Bbc5l0h7LifIX0zvRgfYDbxPQaI7deEiC+gp5D6tV8Ztt9Y
	u9Wma1Xm1inIi7H+1t48u6YTvab1bZRSPTeQGsHYDkLfkcTFK86W13sFk33EvHCO2X7I8dTpFuh
	fqzpF
X-Gm-Gg: AZFdTZcpTKwNXQIIDDlEuMglApT7ipIwc9hwiGuWMyU0y2lQNJfjmqeIPRYb2GIhg77
	vE15ARJsfvOMPBU4+ejqAeD5ABRPBUKdX5GhjJ/KZpby+JOnybTmX89e60YMLCvjqRZeYCptzNO
	x1+FYwo/7/kXQGOLYoZQXpqfuF63C/dEOrquOSrDyufYl+Ntw/KGGsZ6m6sWcdcyi83I3O9Su3T
	cRlhknDqmdt5W5np9bFdtlOPGBKiVjV8Ui8JQXeUDvYPi9eds+U8ger1ChsgOeNmu4D5CyQ0tHk
	3+9Q+iPfVgZEeb/vvhBJT0drW0yAArT17Qjxrx9uxnNUSAyHxmfKxNDcipx0uY52zFTOjXMRS7D
	Gniieq7qeiAYhe7bLhYUV6zZPasozvxprZOyCl6wZcwzPwNdAhExD7lvngHGQ6nPqgShbK7/NqO
	IJ6sBMyrzxtYBxTcAZ0JbIpVbqhTFvPBsUhHJqr3d3yJojJxRy+WEPrWvdkL0bsAyv/fiUwL6IB
	31xDHmA8cM29QFYqcR4+K+KW39sbmauVRzN4l0D3CH9mpzTPRNEDxJGBjl0OhGlRjFh7oITd08N
	XIejWZ7y4DiAFYoC7GGjpq8HF7HIy4LfmWxYrcP3sbiV8W+zc6y4FOQvvn/uef04AENf3RDZuh/
	Ka9/4G/iRKd08YCFDndoT06r0iwEnVEukz8jgNR7Hsm3oXogm3dOqNPSjVA==
X-Received: by 2002:a17:902:ec82:b0:2ef:f3ce:1e91 with SMTP id d9443c01a7336-2f03f17ce3emr31129885ad.9.1795174468638;
        Fri, 20 Nov 2026 03:34:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm5741675ad.34.2026.11.20.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:28 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:23 +0900
Message-ID: <20261120113423.3069216-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005698;
	b=MlHoFDdaOsV/OVKlPCRRR/mB/nJNA52U7e8n/e8dpgVob9fBVPu4CRlx2RT/AWO/vlKC
	 0zCe4GVU9dszUgBrPKbfkymMdnI8sd8lecdqC3UdqfWEg/G2/TNqbNXsdY2KiAaXbWi6c
	 Ev//ibWFFuIQcVBEaekaJJMgrpSFKrc06LA62YFsCeG4YOzD//wOa+H00M1XuWQsEACd3
	 iddRZsZMO20gIGfo+2hWJX5IBoYIIos4DbTmC7AuYPkA8qmzpHa7K6aX2KgZHsM5LfCMC
	 KhnDBnprzDU0wSiUxEBU6zk4uN9z3cH7IZoo0LYaddktW4MnZduhBvQO528KX+1gtNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=P21wE9toa5OHroN7tGlLyc8DvXGFxdM1JVkXaExZ03/0C2zUFc4aphxnksvJNeAo4ftQ
	 q7lEpltfTWGk2VwEoxJpKWF3eMU3wmoBbHbnFvA1sFHOYfA3hzE2JWy3gyT6B7nyB0oPV
	 T9mcCAkPB7cLHtFLUzxLyzCxzn5MO2S4SGX3Hcv6Zl/usjdcBL4UjujKleleQEAUeYQL8
	 DdeUgIQMTtBtKe6YelHoQPG54AFb71LJAUB/ezEhr0TdoXcipAonoeJM7gSBEp6F7BfBE
	 A2MSQuDXkRQI80ax+s1EyX0kDApJXWmawpk/6dIBFu14Tw59mOMY+y1sLD7MK5ob69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="WhBlZ/yZ";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FC60A2615
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04FC60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WhBlZ/yZ
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efd993e9d6so4142345ad.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005697; x=1795610497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=WhBlZ/yZxXcYb7YarQ2nn7UczKWtdcgeVeO+6ldy4EOoIJYb3YZaZjC095fV/8pbmq
         HpSqbZts9dPVoEn09rFZQjsDt+8hRqjfo4Kud5wn2XWfdbl+8FfVmf3C/LhFUy4DfGfw
         PYuafEvTsrjWCHjhNXlROmzP3yATggGmR1Z90hI4dbi70UxIvZvY4kNp+9YicdHv0lcW
         kS6ZG1VuO3rip22fP9h4OXQFVsfM4UjzP+C4NosqMqpKRy1xwFchvF/ijdHsTp8u3/1V
         cylXYxcVXggW4BbND0xySCXoCZvrVe8FBZIo7Eur1e5grb1wtbxfD6Q/6ERJbJuPa1uQ
         cbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005697; x=1795610497;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=mAACeox/j3xThqdvVgDmo+lad3yTB8DbIUd69gV8pImoBTUd7+onBLeAO8f1G4Yc8C
         KbmuImdo/knGTh9vAgKOmVoP3T5yMEXUdly92KPw+bMkDsWJFIwDTOLchlH+Yp4+Wdm3
         FdtmIPW5LsnR5Cnk1NkbgiTeQPuKlJO/Dru3ByDRMahtVlr8UPhmDtImrT0qDRHUTuso
         PsoxmsTRyJJaAWalDpi9SOm+ADTIcMVT5tWfKCEqjnmrM3/Iv73afmSplXXt8fVtAgZc
         cHVfRYbRJiZtkjEAOOgB2jW6yGNquu/KI3yQvUMvB8KOa6jG6yLjUp3vXH8zA5G9ervC
         RHCQ==
X-Forwarded-Encrypted: i=1; AL+hErHnUa0y8K+2aiqw4UpSnvXYiV30bY79YxDO4aEDkei+JTDlsi9J7pxXAU4gqOO3hJPWWxg+F3KBPLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yoKX1eBvQ+wDtQINIVRl95RkoEqcVKtdgyOAmbQiB+nTjWCI1
	W2Mhq0opxmRCGtlP+tDTBSWrqahWJ/AjtaRCAK1hGi5ha42Gxv5SxAq71Y1LeOl+des=
X-Gm-Gg: AZFdTZeH1Y1Dzv+qZ2Hn87nSHI8uRctp8dQC/33c+lUyfIUAip+ffeV4dlQpwSLeUtE
	T5sf3+kToOxjaQ/VycT37yu3pjGI3RLqqVvTX+UhdQe6bYTNkMRrfF82O0l9J71PpViGELaiIxG
	TfewwBMjHi4CMczl/FGvP8zyRLBzOmsZ824PT9wTPXEbDagPpVzJwvFTE5WUleaUIHtwoqYF20Q
	PBJPHIuC5Ir2xAV75gmHo8s1EqpouDK/S4vNV0yNkiaxMn6jvE59Jro4awR8k0Pgr1Lj5LJk4FN
	McVg4GCsDXSSXPfk/CpECBdJBBP2ws4GQvam74f1bWZyMxRsnKu4OzRleaieAxVVuYrVurl6UWF
	o+I39hnDuo8sxYZYvwPtyX+Ndr1mAGq2mUhnSIiO31SvtmuUhUQD2xB8hqawZrb8at8ghFxZnVI
	dcnIVX/4xHkkIaUl+FX95MrtqoINFksVyyGctjU6EfS1MUhqSjZ0Q5Qpa9YdBLvnR7I/dhO8/Ar
	ntu28xiK4tOJOD5hJSvAOu9MmpHnA4VGIrLyGjj+mt8AyFwl+OnB4clDAMeCikkrUVwjNwGrRqk
	lO1XHlY5hcfAUpKPRseD217b9dqcQskDskVQCuWqEZC9Myntsd8YFv6tzQmRwbA7aH9DZsMZJUA
	/sG14jcDg2b92ml9HrVPffO7QN1NuRVANK9FlVw==
X-Received: by 2002:a17:903:4b4f:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2eff754479emr17857265ad.33.1795005697064;
        Wed, 18 Nov 2026 04:41:37 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm12923485ad.17.2026.11.18.04.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:41:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] usb: gadget: f_tcm: fix infoleak, sleep, and UAF in the BOT completion path
Date: Wed, 18 Nov 2026 21:41:25 +0900
Message-ID: <20261118124125.2428233-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
References: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
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

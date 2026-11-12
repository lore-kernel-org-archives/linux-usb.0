Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511136;
	b=o8FSG6MPutyC11f8J+m4t4l+ri/LKQFkc+cjIP4qq2J0z7snWvvgWVzlm2rk+7JQHMd2
	 AB4RDb4TO8WznkMNirrtnNeNnYLz1A+Hj/HCgqCr0B8D2Yxf7G7wUiDa6yTbkD2M15Z+V
	 tn+ws8gpoaJOxFll1Oo8vVgMXHfhaUuo+DLjerDSXnes5+AOBedMQxwCJTB+tH4Kto78g
	 hsIq8EYZUyh35XCPdTITnYhKjjJ0lFznpRPS48wGxCEiuodMr84l3Dgv5gUn34K9clx/m
	 QMZHSPTB8+XhihUrfGzUnmYfMse/FdiBa2YPNfNc/1+PcKPNVJVdz/1/u35+RJ2MKzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2xAFYfFMX7vcmoudCw09Hc8H9iGMxUWUhT9MyulLPKI=;
	b=XCxPZ1ZA+Y1da4Fr76ClUn6afP7UFmy4t2PMQcYZU3emFx8VNDOKrJb3Fe8MQ7DxG4Ca
	 vm20y9GbgkcH16d0vNn5cmP4il4DxKMMCTaxwa+H+kWoK+aBuiFBV4y7di5hRPDkg2KMQ
	 8UINhRoM3Glm2fyslrOElqcWHGl2OP4RNlLCK0gIAE+gh0iqQibfPqTj20hjYGTUCing2
	 yyCcLkqgAimi7iWzN9RskCbBqVZNKUIxeF0w9HrME2exfmZROb7SIopAQm0Xd4i9Sztk2
	 4DlRVpltMPcI/BC2RdmcnU80xs5GX8IHhqqBY/sMJRU66RQItXqEwhvS6VoHNMFRe3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J8T4Slv7;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690BE606A8A0
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 19:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690BE606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J8T4Slv7
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so160048a12.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794511135; x=1795115935; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xAFYfFMX7vcmoudCw09Hc8H9iGMxUWUhT9MyulLPKI=;
        b=J8T4Slv75b0ghaSYdyZWWnRtHlzAVKGvgmQJoM83dVvU3xYTc7iUKxbr/nZxD59Ubd
         uYgim1HcnivsRZct2sgzbnl+sv3vcF8pFMlSwqxfAvJWteDQprVmzKFllAZPfLBJtmTq
         JgtDWhm4j1ytJQiqKa4P8WnznsdJimF8nMmp/GzOBUmjQA8YpwS9hTnzbIOhy49achAz
         5HJuqJnUpPwPWfuZupP2v2/5+zj5X5dZhRyrcG9lP/9tbhHkXa6DCvBhKede4th4ywm1
         f6YbPR/I2Q6ZNcEX9mcz6f90V4ctGhv6Cc6K8uiBH6JHxGZc4OTHKVPa/g0UW1GM1X4s
         GJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511135; x=1795115935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xAFYfFMX7vcmoudCw09Hc8H9iGMxUWUhT9MyulLPKI=;
        b=iAK6yhDDCrQSxKKgR7FaKUhQEM3mB+yXesMECDlWncAk8TMx4HQ8A4ZePZ6Ex2LD0/
         DjftYjVZfQj27Nd262dXF/mUvJWl9SXzQ9p/z2qrMukrAprYUpJMyqcLcSNAyVhkoQyi
         CvYGxN65I8Sh7rLYbN6Icucp4oEe6uiWRxPm0dZ3fTj1XNvWhEXnfYLCZj4M88LnQCjV
         sQ6qCZt+xUqb4Urpm6KcFIl3x2M4f2Pg52jiFL6usjLdhK/Gb9TF/OsI35lRjvHa+7nT
         K8BDxhVvElMvfDbFpyiJegwbUbu+/AkPd1LnmafZAORIFYRa3T9dOZ9C9maY6MBgMFpI
         wf+g==
X-Gm-Message-State: APuU4Z9sim/6uWQINWOpj26pMWSI9yQE4Bl+DhmUGzqm8Q1kAtBHp5K+
	SlO5BdiQTKlFAA8MJzEttXNAPIBsTbs+txOtj4jCQIPYDigRs5NtLwgnM/roLJXD96AfjXukHbf
	YGzSbKpTHKg==
X-Received: from pgbdo4.prod.google.com ([2002:a05:6a02:e84:b0:cdb:915a:35b3])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:66c6:b0:3e1:2502:529c
 with SMTP id adf61e73a8af0-3f7a68a47e9mr143310637.23.1794511135149; Thu, 12
 Nov 2026 11:18:55 -0800 (PST)
Date: Thu, 12 Nov 2026 19:18:50 +0000
In-Reply-To: <20261112160448.41566-3-lui2012qwq@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-3-lui2012qwq@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179451113092.3909038.3452448115018403099.b4-review@b4>
Subject: Re: [PATCH 2/4] usb: musb: dsps: free the VBUS interrupt before the
 child teardown
From: Neill Kapron <nkapron@google.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	nkapron@google.com, tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 13 Nov 2026 00:04:46 +0800, Chengyu Liu <lui2012qwq@gmail.com> wrote:
> dsps_remove() unregisters the musb child, which deletes
> musb->dev_timer and frees the structure, while the glue's VBUS
> interrupt is devm-managed and only freed after dsps_remove() returns.
> dsps_vbus_threaded_irq() re-arms the timer via dsps_mod_timer(), so
> a VBUS event in between re-arms dev_timer past its deletion and
> otg_timer() runs on freed memory.
> 
> [...]

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>

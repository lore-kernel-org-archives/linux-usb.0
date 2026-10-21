Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574833;
	b=2KhvQXaOthhJggtGcsdMONnrPjlKEDdoAh4dbIcNjaql1Yz+a/vPP3AptmTK4DAnPqSQ
	 v5rv3cXI/H5lu1GaBkwrKoZL+FttYB1H4tW+gsSsoZLq8geFrbtvASlwhxfYEANjpI2oa
	 9CIxm4g2W2Gdv3RA8ukR5w3MgfGYaWthDzVRWrwzUwyDpCCk8z8AdD2gY22yzlIFbfjWN
	 Y5/wfYXXTy100NXGOYAWq7Bh9JzK6dKsJkghJ0zmCXchfYv5aiCtErveSTfXQTR7Vww6n
	 /9JCMGBHR+Qa9lVEf88N9OqKIAuYW6B/5M1TEL96mkZiMaLcyHrMFkpVA6grASnUWzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
	b=CAGuyfRLOV6eyItllMKkFUu1gX5JI7BffPvMjn25yMB4IlqTT+swXKzZWSaAZkTEmzkg
	 8sPGSrrUbeN2x1d895HkS/t6WHUb49MS7hybWpOzXHb+QCwWFs5eEQohQSZSbsJFfjrKH
	 R2MJg5cZuLCqFPpUsq9TBPxjv2ZzdcY1UkuvYX6tsul1BGY7PTNcCKIzi6wiEhp1TxGVc
	 cbEejeT36uk98dDPFh9SnPZ469+66A0FbJtL3kB7anNJK3MqC1UynJ6RzAb/H4a3mIr1z
	 nnURvgVyH7wC/3f7Ei/7NihoIAPGiQm9135xwOZgj4Vs2SNnwPQZm9S0QhdHZ0ET8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MIJrvosy;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC66606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 09:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MIJrvosy
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so3564715e9.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574831; x=1793179631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
        b=MIJrvosyhchoySA6M2ALuD2hK2i7sP5TXboHiwjpDDDnGVkv8xuog2A30lshVg1tY5
         o64M3aBqnP9h8QfrR+V2mbwqpld/OzqnxelyWx7m5BqaVd1GMG/vWjeHbJO/HsAJguQp
         4uaQZz13+TpRFNm70wAukTI7xNn2ieLfPJtaqrAv99DOsLWIDmud38yU+fczSnZw2G/Q
         7upiFYKPYutM7qQO/kBDezbI4Rha80n3nViPTvlWRJz3vykLrq+wEK3+rMvmm96/K80A
         ZimIIpqyqRA6z1HUiLd3+GlRNkLrLSm7/C6gEYBCl6LPKBqMuQL+ckk/yIRVBDD4NruJ
         FiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574831; x=1793179631;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
        b=THznLnYdatuCTaFJ82AmMBNeaHt+ysZYZhutznpWijAzsLhPzIJF23CxQ9sQsOHHHP
         KtfRGbn74/H++0ab57q/l/jKQ9NmUaVmR2teeW6C2FNBGtlPQSRp8BcGcEa0Bfbx5zFP
         J+UCk/9bTWIw3T3GMgbhkeWL0DxV8VLjCczpsGSC3bdCbXmKqkKtxx5F4ir41PZNoOm5
         VB4IOzNKXCFk0hz13qTDWEhh71HY4pqaOSeJPUiOBm3KNdq3UfB3UfRL88rFRrHmylaB
         LTuAnr6lGhbuzPKOsN0FP3+q+9LL/2KVfeRrrJ47WUIBfrb+SCRXGoGwLI67KdWvaXg4
         ZaUg==
X-Forwarded-Encrypted: i=1; AKwUvByrZIi0q0P3Je9Tflx8sOOpDRz4WS0p4zV0a+5gVrFhJtNBzTPbtrBiXX9hsbX35S93TdRBFXEn0DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJuKk/pUJTkUG+5HcTHylrafAZ0OZK4Sb8uhtalR9uK4Lf9Yk3
	mxZd8rkkLQz55fshXzpJt48wUxwU11NN0X4o7MJz0SvWJFX0BAjfr+I+
X-Gm-Gg: AYBFou0921LyA0Pp+cx2xqXW3HsB9V8p9gPwcDF9qD2Gv564u6kkJuiKpShNJC0YRbe
	D6DSGM2tfVOhpAZio4VVDXRplTNXLXp95T8PE9JwPRTM5yFYP4uNUALxug7EZ5ltlWXa1tW8568
	/C3uSgqWym9V5BRun2gyjen64mBuVzM42D2Tk0Y2twer9m0gIjFwmzebzc62nGMjMBi23XiPax7
	btooJpgRmRTej/X7tBUkFkkqmhbQKZxj78kawCy2IxqLtuAZjebtgqVIERlfq2vAb/815bo3Qzm
	2kdOvAWKHHTLrzgEWpm/CDvHo9vbXh1z2BOBFUuVCk+GhyT6QDrxfQGBAlxNV2zKSEMQE8DbPxz
	7TrsjQNofmBiaUxS5IicJDblE4lijJPEvimnSjNfJHDRCEZ1UQIscI8ybkCTtk0AZYG2IOZDw8V
	5Pm6cO7uboVIk2quLRBw8Qt+UE2awhYXWgXHc/ouqkMb9Sj6IBHTQyA1RKSV7daEEg6Ed0/6vkH
	2k72W/l3BmY+WwOUkjTJNTcS1nD3DP4/VFZCHh32Iol7dHRKN7zg993/qwzeMmrZfM=
X-Received: by 2002:a05:600c:34c4:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1fdd37971mr30903995e9.19.1792574830916;
        Wed, 21 Oct 2026 02:27:10 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm129038025e9.3.2026.10.21.02.27.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Oct 2026 02:27:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:27:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261021112705.19fd90b8.michal.pecio@gmail.com>
In-Reply-To: <5510281a5d91bbd435d9920431a3fa75@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
	<20261002161828.365ff859.michal.pecio@gmail.com>
	<55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
	<20261006125546.10471489.michal.pecio@gmail.com>
	<64515dfd9a6cd8c3f5665e72a6bf6b81@linux.ibm.com>
	<20261015103307.3ba25345.michal.pecio@gmail.com>
	<5510281a5d91bbd435d9920431a3fa75@linux.ibm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 15:40:24 -0500, Wen Xiong wrote:
> Above patch is similar like my V1 patch.
> It works fine and all usb devices are showed up after executing a kexec.

Thanks for testing. The big difference is that my patch does nothing
if the preceding xhci_halt() completes successfully. So if it helps,
this tells us that xhci_halt() fails and the chip most likely locks up
right there, during xhci_shutdown().

It probably fails due to some devices that are connected and haven't 
been shut down normally; I suspect that nothing bad would happen if
you disconnect all devices or unbind xhci_hcd before kexec, but we
still need to cope with surprise shutdown somehow.

In such case your suggestion to PCI reset may be the simplest way out.
It seems we could either call it always on TI chips, or automatically
as a fallback when xhci_shutdown() fails to halt the xHC.

Mathias, any preferences?

The latter is perhaps a bit cleaner and more generally useful, though
I must say that I tested rebooting with a bunch of devices connected
to a few different HCs and all of them passed through xhci_shutdown()
successfully, so the issue isn't widespread. I don't have TUSB7340.

Regards,
Michal

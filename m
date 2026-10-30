Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341611;
	b=Rs1T2ocXh46OdHUW9AbjJo8Avy+TZWZ0eUKqldzRbrEMAbtJyRLxG+yyHRx4DITVtH78
	 KfSl1owDgX8MuVNTJ4qJwzct2iFeY+FnekWanPr3sbHE+D2V5a4nVrVBW8Pyh2u0j1NW/
	 hygRLF32xWXuHrH65oM7IGty5AUWjYUDZhCZGUHdb7wyWuNN4bbFjbxaQOOG/4aMJs1YL
	 UWNZBYL9qtJd0Zjvz5Abph6/1n9QNryY20gE53rUqJENzta4tX4o/iXCq8hp/qJoS6jiW
	 J+C/6Ar3ZakxaeBKiNICcrjcyl+h0gxudi30OmpVSeTKkWuXN54bi+PiRw+wNWtmqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
	b=J/lYqQaA/S6jDnC1lLaXA1ffHA3+yb9lWxMjX/VfwiecwTit74QqLoroDymOkb43ugzJ
	 HUS6g8sGQeX4dq06qnNYRWt2uj+p1wUw2vOED4T5NwuT4kOKeoBxtidXZcMSXxtCCxOVj
	 BZYrskCHPyKmM7SAE/g0ZWX6rCyyX3thRK/Cyh8TVNeG9nKn+DF/fI2Q4uQZPiue5Ofvi
	 0eJs5nNplSWzkOwtKCsV7VrMEvTr792ngZqH3oD5OZcoymGtHrqwTJm1TA2yUliCQ4EBD
	 kuOiPh6JijBXJZ0zsVOy4+cdpLBDLSNKtEkDlW+cVNEXmm9xI7YraLzFgQZqYkRABRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmLxFpQY;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255C606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6255C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmLxFpQY
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0cf2c0785so3115207b3.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341610; x=1793946410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=wmLxFpQYSyjon2RyTp/gnBSJrj/AkXKK/CGpaoc2ydd32rJ36n8b1m44ghQaVKhYjy
         qHzdKWUzDkAwer6cJjTwVHRmzu0tYKqswsEDQeg5qj1bZp0UmAad+j/SX5hnADnPD2vE
         BUknnzMO6mywxqRrBvi2xmuqwTk7IwOkGC9k0dRflf98qelQwwRHCyRJp74u6cVjC09i
         t2rAulH+Zos7xbiPK8j51BqUfdmcUST8lxcLc0geaiVa3uq91D96/9hid4MDRc+JAchL
         n2+f5oJGdgrTfTGTH0+kRR9REVYRK6GJixtaSZNGcWiRu7P36jeSo6JrIxAZ1kAPRm2W
         PE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341610; x=1793946410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=rjB2OFEJcaxEXfWwZuFt6KTJmr06Rm8adaGthkyITfX1nMySZstGIbHaU/GV3M219g
         iYq98JEQPo9HEfo0mGmhHi0ImccekZvpagjqJ4I4xl58CUsEp/khOQ07DuEzNgQXIARJ
         JZrmS32o4O1/S/2aTo3k365NaSO4Y9CRC7OPnWO9eUV9pmIvC7iHspeP/8Y78Z9Kox+8
         IbLAIa4pqmscFbqye5zvViAOtM4ny8OtmFbPvAnOqWnxUwEh6SCJjAMhPSyGkGEco+W6
         g3PRdwNd6pG5bDKEagrCtefFDuMgOZx65fcFwQYmhy4TNhAGrOc3HhbaHYsbMn6/mICs
         1UwA==
X-Gm-Message-State: AFq9FYLq7S2j+v9w2buFAuOiW3C7r3v2IojlvsjZdAK/Lo1Au4/z7S8R
	sYTuLqefS0odO9BQ+k9LCaB6hDW4YvWVtJoYke5+7raJHyZ9+7GVvnnx
X-Gm-Gg: AYBFou2EXEcmDGj7Ul+ouF74tRKCWYCOlp4T5XqjM3lxg1Eib1+Icyz/1JeKrcSQUXS
	2saxDMBC6xcrzFzGR/VgieWdlYsBROmrd6O8TAoe8icI1USP7k8a5fDpsz+PfmnxaSvWF4dqbdP
	ScGliKaIh35gZmSw6j60hin/Eui5ThvGaymEveJOf5aHb3tfXq4nZlYPy8aLibNANiqK8a+tOT5
	C5gu69fVY3sF5i8KvIkXXw1OY2svBENjPOhOwVRaWPHjtZ6a/taEZwInXPTX0lz/9L6JEXSKkAa
	n/8kIB040sdu41sPIeJtmzB0YFRa0Wpwj+ApmxI9X5ASgTLvoZRq3CJI6TKV+2VU9KU7eBxcosw
	rDvn1I1UILfA6yAXcESyHtEHNIDNwwcrrDnhYObDNX3uInt+mWgYQqCE5oBBhP1P9eW+8WUS7to
	0ZIUhRw4x5vj7IIYULT4i53B29l04NSt3fG4adA8gU+LNHzCFcViGqs7FrLnqGyFcRDbKZtcnaN
	yBprTq39DFBBT3jwRf/SPJGrQFXfYvZ8p0WVj52saBLNm2EtnJGLCXDYxf68++tg9hezDEOzbi6
	ZmHfbjS+EpagmDa0zuIKxoh+ttwH5QmFfgRaIdJmvW66exNvsLBEmwOJVYyyCuATa5JdF1dEvJ7
	wf5uLc+k4
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr7452207b3.30.1793341609736;
        Thu, 29 Oct 2026 23:26:49 -0700 (PDT)
Received: from [192.168.68.58] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm4625317b3.33.2026.10.29.23.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:26:48 -0700 (PDT)
Message-ID: <dcd98f40-387d-4a64-a39d-9d1c7296ec7a@gmail.com>
Date: Thu, 29 Oct 2026 23:26:46 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget
 registration
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Xu Yang <xu.yang_2@oss.nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
 <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Finally had time to test, and it works. Thanks!


Tested-by: Rudraksha Gupta <guptarud@gmail.com>


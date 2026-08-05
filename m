Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC003E0243
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921805; cv=none; b=LQNgB0/tUYdOSCZb9cRfFCIswGnMnPUd0xSwWtcQoNqEipkPO+VikP8UYs9LttGSUQTMaxsx7wt4wXAN7r55TZ9vTaKBvtZBTLqubXIqKT7srT6aWnbTvZ6CtizLZn/tkqmZwffITdQLCG0YAeoWsdLpMxjYKX+BzwowaRE1NfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921805; c=relaxed/simple;
	bh=MZCEPZl0ZFbsMwGuo3y43zOIDo/hbmY79R4mzKfy0j0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YG7XsSh0d1Dsxwt/WJJtcX6xAAq7Ug1hWrE/ZFFPvXv7OO8JY/UnznREMA+WaFlkO1VPlYhl+ysuRqt4caQ2SjAXiXKnihYe01t1f2Y6xvTc9NJZ7sojpW48P/PVZJFzXv6eHC7SbJX8bFjR8hsOIWzvc0bIe/PraWh82qm+wv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5LHKO5G; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5LHKO5G"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacb8416a1so8589225ad.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785921803; x=1786526603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZCEPZl0ZFbsMwGuo3y43zOIDo/hbmY79R4mzKfy0j0=;
        b=T5LHKO5G9Lo72wjaUQLTQGQ/SNZuX9uMWPSjxIt2rxguGMu9goj1EisXFX/jRtgxli
         QHjrRiFU4d5VqJNOLlhMciKeUXkAgKtLQTbtIlMDApwV3+EQM6hlBWQat6gJVYFkxbKy
         XcAArK5xFtTLbIWrMGY3IA1ACnIteJM0aycXOOeAG5qzTdVzuhPvuwpgEycHBSG0IqmT
         MHo3CJb1+F4j6vO5u+XO9pAwgBNxEdLqRPdmQeghA4hCO5wivUmqsmGgoH8Ls+Yf1Y8Q
         D2j0p7c6c4rZfX3DE82GycM9rJBEU2RckoAyN31Nkz4X+Ghncx8/ZK3QYniz5TGeYDMF
         oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921803; x=1786526603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZCEPZl0ZFbsMwGuo3y43zOIDo/hbmY79R4mzKfy0j0=;
        b=FPqBJsOjvRZLntQtUoxmgNY9cpHlYDPetyf4rBvbjIv7ZRJCEzl5s9hq3RDKo5k5yq
         ziNky4vfHI4l6zHNrZqXEZ/DuAL2v6K3uWl2WfzX7+QLYskxtQge+cOn5ruXx664TdZu
         foB3QOWTb3PE8BwFbquGoZGpdoKPkjb9KiRzcNQ7v00A/o37UeFkU7VYN1J4xX2dDxD3
         ITowYeXW6XrgCVKFQIqrFcCU4iTwI1KgKW38grdnUwCusq30XOwB3VtWwkKw5jjO1lai
         b33NHxnr3NrEIq4VS8mJsHOi/9Vt5Ziw7ML4H2PW3NWiy+HvMCDDy2vJnY2onsc9VG4+
         vcWQ==
X-Gm-Message-State: AOJu0YxxNVcqaTYTauSxqvCUTav0NzOkU6Nq4Qf4014OZTGIo/Jzx926
	+H1lR8ljrg1rdoQHB7mFQNMBBEyIz5QeKtg8+x0iGtQYmqRLz6EUKea4
X-Gm-Gg: AR+sD12vtJPNexH5QIAowaY29gMfGgHXssmzSSzj0kSPWqOnD2mwB1z+dtZ61SMj24x
	CSOIpq8pq3K+0MjfAKIMoBJPPQtGy8cZkRF/o/lO3s0HUIEf3ND+reThHVwz81TriDyq1vfi80n
	eMCB1iqGLqt49o/OlMNhiDz7IAAx2wfr0WxHsEVsWRGlW8Weci5SHPnrig4GZUDxzMiIJFgsm7R
	x31gfKNeMtVvBFzB5prU2Ifqj1aqN/m/Gsj8Pk7zz7RO5bqyzpqyQYI/13kaiyxpQ7/1nIzc1fe
	Ak7HPPMUkjvMGFFiQguNSaqlMXS6H04JhR6mvL70SrBT2Qz5sDWzVBXL3Mly+YbqdyhMFRB5vS0
	+/SOD9q8f1QNcPazGo+FRq1ZJj1K4uLLxFHjMuwLks1RHrNYdGA6JZAKqNLs0qCN1pJUBi/W5uA
	64q/FtejMe8FhfHJ9yFGupHBTb431abgHNkMUuUH49hAicfbK+w9z1x4tjrHiaNsBIZpm7fNiHf
	VtguJkW2J4HiA==
X-Received: by 2002:a17:90b:3841:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3903c54b375mr5522134a91.6.1785921802638;
        Wed, 05 Aug 2026 02:23:22 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39039179fabsm2562694a91.7.2026.08.05.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:23:22 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Wed,  5 Aug 2026 17:23:17 +0800
Message-Id: <20260805092317.3298203-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080532-reverb-freewill-9228@gregkh>
References: <2026080532-reverb-freewill-9228@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 05, 2026 at XX:XX, Greg KH wrote:
> Great, but what drew you to wanting to fix this specific syzbot issue?
> Do you have this hardware that you need to see this issue resolved for?

No, I don't have Phonet hardware. I work on USB kernel code at my job
and was looking through open syzbot USB bugs to get practice on real
issues. The race here was easy to spot so I sent a fix.

Thanks,
Nguyen Quang Le Kien

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904496;
	b=T2WvKTgOu1jf1ihoACpiY30tOg1feAMu0tuOVuRWDh9NjhhgLHEo2eyyiWq6nsZ53v5/
	 zChEuc7YGVw9doN/EjTtc5HdIEya3I1CqVQtbwheKApVsO6qZkudg7ngUGpHKdu0RT34h
	 4zpk4k7Q9z9TU8YunAhyMY0dgMheo24geXqpe7L1QyFURscmbZJP3aISoLA8gNg5jrXxm
	 +KD/xRuEMHuvMQvpli2xrVuUMUNQAEH2Fa+J8v6Xwq06N9VSt4x9oQuoRZZjT0gD5Of0s
	 KQU6kO5Lz5nBsHdpsgy4mi71uCEoEnaJLSD7d2ghQrpcdECR/nh8gm6/ACiTmJlI1BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=F000XuvkLmMw3fbU3Vr4RQ4TV3M5Kq3cTrltb+DSd4s=;
	b=Ifi6QVrKBhmuPlPZ5uS8IE+MTRGHsETwaQMoAkmCNSW+rRt+CBZQwm/l4bQHkyglBtFp
	 PkEoCqEhICL8OCU3QtuCTn9/OKpPx+7MDlJ0JQHY1JTXqi0hRYAVqcU7V9WOhOv96gzOB
	 ZPIFOAUl8fZw5NWjWMMFJUvK/VCXn7JagPINVKO06/1rZvNPdu2RcrRC7KTr2YlLIgrwA
	 seWFCZlHWQXXg4Ht6VEBHt+thOa3G2y0rRxivt7msXLlMewVbuXjc7I/HKCBeSFIDhVPi
	 CzjCwb88cs6Jul5fwPAyvaeV7Td98lFnlY8ENzIE5Boi8OcwZdSVaNjIldVKUD25hlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VHsznlmy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3F606A8AF
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC3F606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VHsznlmy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so18706755e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794904494; x=1795509294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F000XuvkLmMw3fbU3Vr4RQ4TV3M5Kq3cTrltb+DSd4s=;
        b=VHsznlmyXppPZ/bPTczE2gEtxfYqqNR2KzOL5TroMF37s15W8DBXaNk6UrDZ1hAOHL
         H2DfI8NVJvIQDDPYBG8/5Rcn4HX+rcrxB/q0dp0DqLAXbSMnUwXjyLWbtY0En2AVNZfB
         vFCn5gexJgDIjlNCC5tRaLXLxFqvLPsaENTtTH2AM63q3hORG7JaDcs7ExiuqZ4u5xwl
         ItnhYdutMy+lntORVR0fWBanrBFcEpzU7V1znbUL5pSTDCf0gZj8GKC55aJkWgWDZ5xW
         Eoy/aXWLv7QvkR4in+Bmeut91pKQq4cCCLdly/NU3qWoCJxY/NZsws8e+gKMIGsqQoOR
         ccxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904494; x=1795509294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F000XuvkLmMw3fbU3Vr4RQ4TV3M5Kq3cTrltb+DSd4s=;
        b=dwYnAs0kDh5j77IoB4AcuhLhRQPOAOZ3/nKcczK9sCEPAG6JLEbFiIhfMnkjm7uhYA
         liZPDDG/wzat+dpYvNTxD/dc0uHeGt+UaAugIzzIIKP6Cgg64DjdrQWJb+P1XXUQw/IF
         vq1UO0J1JG7WxYHolo03HgEsm4dnKXJXyVkzzVJZ54oFNsnwObyWE8TVvJS70Iod085C
         x7XiErEwLr/6MccHVYWZv7429wNTz4VDdpz9VC1SQZJbE15i7ItA3mISPj2rLJmTMi5x
         WslZRwOkA+kyBKtz4LQ06MpVb5QrWJ/u/gH8ditzmRKXKNWI80i/iNvVi7MNdMCsz92v
         zgWw==
X-Gm-Message-State: APuU4Z9I9Q3RJOJhLaq8xL/bvScxG0DRpEaznE295DqxXwBAOJPkDbmr
	ZnJPEU6+IjgyoU2tzezgF8h4yA/90z0jwCLGaX76LhfTNCESHYvizMddIxpvPtd6PKY=
X-Gm-Gg: AYBFou0PQGu659RqBzM+SZuJSwMfHCfAHwIDMTFTVXwQlwmPhU0LaRZ+lgGDmO+6enA
	fwWRx+RJRV7JJ/5lWiUkVk0Lg+PKPK8GYsUE9f7xh56dxLeNQe5iktu/BohSymDBQrlbkQEyTR4
	8vejYl+rzqh6rPJi+zoTGLHtWJ4sZMCcTq7KuQ2kjMJsTeBicaUN9kRam+cr+2iBQEPAajKTmvF
	Weui2pLPOydwBQch3xJ2je7NxvpLqkKkv0DT84j5o622t7pqH5TBtoB9ornjTF3W61YpBAbN5bC
	qEpJOMtr3U7KYc7kK1DxWXT6HxhqeM6PKP6bIB8oz4VANydvf7MTnUvSUqlg1VM2gIIUMMCpeDZ
	g83Id2yCHKnl9uEiTztejPcbKROptJbBUKLB//x23fkddZGSme7udL3he+98sbcELqG1A5pn5GP
	c4hT6dkV/rPaB9/Dl13agKU2tDBvsPr5eKZAC3uJO9TNbtbZj6kRVJMQ4JpMb+X8xxVG7cRPdtp
	6vcrz21JFHMha+l6n9eG2mY4MFbpuoaHG+ejPTBEYY7KoE1AnuPxaKqEJVlNCnCHrw36DSSybiP
	wSC6n2qAxwyzg88VXLFii3dob30ZpSusHNDrzc9Q9kF/rT0By9GrSOW22aqKJWFmxENbLKb6rbP
	hXvo=
X-Received: by 2002:a05:600c:4f81:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4bb5f3f7efdmr210737505e9.4.1794904494125;
        Tue, 17 Nov 2026 00:34:54 -0800 (PST)
Received: from [172.28.20.244] (ppp-46-244-232-206.dynamic.mnet-online.de. [46.244.232.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52440605e9.12.2026.11.17.00.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:34:53 -0800 (PST)
Message-ID: <5ce29ee1-ea5e-4ebe-9a9a-f16844ad7b78@suse.com>
Date: Tue, 17 Nov 2026 09:34:52 +0100
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
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Eddie Chapman <eddie@ehuk.net>,
 Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, oneukum@suse.com,
 usb-storage@lists.one-eyed-alien.net
References: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
 <e2ded4e1-a7f3-47d4-a3be-d7c6eed3e436@ehuk.net>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e2ded4e1-a7f3-47d4-a3be-d7c6eed3e436@ehuk.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.11.26 22:04, Eddie Chapman wrote:
> Bringing this a little bit back on topic for issues seen in the Linux kernel with Asmedia USB to SATA devices, I'd be willing to wager that a lot (if not most) of the time, if there is a firmware update out there for a chip, there's an excellent chance it will resolve the issue. But it is a mine field for users who are forced to take risks, and it is a very problematic situation for Linux to deal with to say the least.

Hi,

do they show a different version number?
If not, I am afraid we will have to be conservative
and blacklist everything.

	Regards
		Oliver


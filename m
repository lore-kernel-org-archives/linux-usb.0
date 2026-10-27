Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094880;
	b=vpLvon91TTRByWVssnraJoiyDWM21OKEwqGYW2MeATnC5LK/gj4/AHmYBlWcHIphnwXE
	 4ucIpIWFZtSNXcUC9hUzLD47kn0QLlet0IAOvbJURs+PFmce3zW01zB+VFjalUcw/YFZ5
	 4mwzw9nZh5528I4Im9Ky8/8ucl74M+tBap89o/7IlavMAwe+kgxgNa6mfTfwCZzN14kHV
	 yvJtMRWoyVP+Xf/ign+IkqEsNHBllP4Ir/3bRtzQl7LcXcOtGDpKB9Y8bQ1dGDUgCuU0v
	 ELU0j1JUc9XLSlMcea9bMRRXTLfHGu7Bsz5s2t4GAKgC2BGiQKpBt52UM8KB89jsxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ipfBmA3cDTk5OYUp61WVnNo/Zii0SGp5r+OHgfJ85R4=;
	b=2+wAZkrofOB9/v3Ex2acNAOV3kWKhrywC+CIr5kPKwQ4bcZbSA1KwEb55ARmDtuKFszi
	 cTNUPcFd0zXTBxFuTvq31l8oyiYWFyxGvcI3zQo5bEq0AWJP2tugrG9YkNS63FxnEPVbi
	 f852x38OmkMcVGkKyiKXd04QwOj5UJ4SvwWqIKUbNfE/1WQyOOipxsD6qhNCU8Ki3BR8f
	 6rWor1hh0Esf5bwPW1OWFxoM2cF7CcJAlAd+sUBv82eSybh+Cc+Kf/gVkUiVJKoG8rRXL
	 jVlIk0xC+Dc82TqCehkx42bSjbAp3K6JA0eVppsD3vhNagxU63IGjjJFKRKo3xpOzDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="HfSq81k/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F19606A31F
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 09:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F19606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HfSq81k/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso40656175e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793094878; x=1793699678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipfBmA3cDTk5OYUp61WVnNo/Zii0SGp5r+OHgfJ85R4=;
        b=HfSq81k/8aDixE+6vVGi3kA5WPN380rWEJkKCDy+PEs2XQb49N1jKVB9EJyPMH/XML
         OxhogzMg6MWsTiHGmywQC5xMxaQBxAJpDzlC9dgEdydaVfpqtk/fp4CK7rObcvx3kxHD
         7vE89l1OF/l+gWm2aiK1G7xFqgnGx4rDEKMYIORmmKFtKzTMwYPxcqCvmlVbqaoiEYNl
         Ki47//JpWUYA03oIqbRmvSgX3c20x0q//qTZOmD5KkmmX/0eyVVRJO5wKCQg+vwFO2Jq
         KuGazVeYsrHkhOSI+05Vc4bG2Z4fsbRl5jVUCpTBtreutarbxH/+z7d/Q2RixeDo5j9b
         CVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094878; x=1793699678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipfBmA3cDTk5OYUp61WVnNo/Zii0SGp5r+OHgfJ85R4=;
        b=qrpts4gXQub+N2xKwSzv9bie/hiA1eKG3GzYkbQpCiMIYH70zFDQ2IuJPpqQldA6br
         97MOU0YKJMgWLooP4RXw2U/8zKq1bUildaCh9fRQAS19IsedMJdcbpfKuoyjHyNcod6O
         JbFZhIlquf6BKgzsvn7n5ROcZ4TPoVSBvnawZBk+t1PxoYEGdnNpTDqKV/JgrWniegcU
         cUB41mqzq5gNQ6xmQtDT/v5Zr2kebF5iDdVLSWNTHsuRjkNcq5KsNfP25InBsxQoylw/
         /bmyQCT/KX/LCTnG8jr6v0D2q3orOGhRBOF67hmMs+dosTt0/KUsqXrIlZGKOxE9m3IJ
         jq4A==
X-Forwarded-Encrypted: i=1; AKwUvBwlRAcpiRCjgdgzErOTp9hPBe0w7YVneXH7SHc2sVUKVsQ6kkJmyRFNimnfQB7XFCbYvyyeeGgCAx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHCoyAGAtT0aB7/8q9ERx9Uh0xVYaN0uVUX+WGW1eyZb/ARp85
	xRtIGaU12ssxZO1ZIVz4ocRfRkk3eKZeaE0vHFfloRCCW7p2sF0Pw5GthQt8W8hmXz8=
X-Gm-Gg: AYBFou1T2et4TdbXbqaOg2IiLMXVKCVj1nTKX4PmaeScjY04l/CdbD8Kk3IB9NSqE50
	PRTGHWxpOE9ThahGInp62LnI+NA3Nk0oqXy9PSYPSdMUpNDyN4fo0T7wdr4a3wZzfpvRpd0Mlev
	W6cKiiUX4FxtQ39v/tKTw4vuFUcJif92M3nAixAIaqBZpmFbf4zxocnHiKPPJgp8IcvvKK3SGTw
	FK8awXx80B3m9dvtToJ/Y3o+hdcGoLA9jvMohKjctGNBArxmUGnRwucbncYtocJ4c3tyuVFUlSo
	+Oy5nHlxOpXTQNqs2FJR0x8AsAy84+xg58/i7ubVfpvy0d+wG4WyX8p3UiP70NBc42606yC77T9
	0Nklowy+idxvuRAtpR5kQSCndSyuEvsACkW1/2UXTKbkfL1mDpus7uUKmvFEwlFxXsUFdeyMvTb
	CIogJuvEd/y6K13990hJRPhstWh0IpfASd6aZayTO7dHWdCPDrdf70K4FyNzkr2FUu2mq9osNxn
	kABti96vLN/6651cXCAd2/GaSbMI3tz/3MC2wr9CSiOEi/hkrfY6D4meTPsO6ALqDktU6cUIfD/
	BYgl/wMwLPgJbZNZK39viA==
X-Received: by 2002:a05:600c:1987:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a35ac3a825mr183181415e9.1.1793094878673;
        Tue, 27 Oct 2026 02:54:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a7:df01:6e79:f35a:ab88:b157? ([2001:a61:13a7:df01:6e79:f35a:ab88:b157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bdbsm17868961f8f.19.2026.10.27.02.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:54:38 -0700 (PDT)
Message-ID: <09633215-e52b-42be-90d9-12fee5b8728e@suse.com>
Date: Tue, 27 Oct 2026 10:54:37 +0100
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
Subject: Re: [PATCH v2] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, stable@vger.kernel.org
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
 <20261014105700.19433-1-olivier.kaloudoff@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261014105700.19433-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14.10.26 12:57, Olivier Kaloudoff wrote:
> The ASMedia chip detection in uas_use_uas_driver() assumes that every
> device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
> config.MaxPower of 0 is an ASM1153 with working UAS.

have you tried the new quirk reducing the number of streams
being used?

	Regards
		Oliver


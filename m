Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917799;
	b=zD5AFRngtvHMU6Tt9Cbr1yiNB1fCeUozZZeVB0mGR2sfNz/mU84oDLhj0I7jRAY0cR2l
	 oVs2/Wo4NPoBhLPLBAVXxTu4NxOyYwqLKhKoYPiEVWDCIY1IUIzB/HicXfTfiT5mAEn4u
	 EeGAFr54ddHCeRgw+BKL/Yse/4OXXdPv4vPM9CX23KbI1/1tvjYKwk8luFmJ43XcNjIen
	 7n3ib+HTsWDZFIDfcaosPtu/HNPcWUfAZyqkCuIdRsEp7PhRa9wQvEwz5y0Bg+zuyizGk
	 Ocn7WoPjUQ9uNVTsL77WGTkmniQsB69ZZfUOl+LCg7gMQ3grXdcv23O9wdi5oWl339Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917799;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
	b=VMCIZfGNzvJ/oMb+j+TlEonwH36ztyxrLhqmWd59jdoVxOj/gbQl1n5b/ru2wjjRzTTk
	 zYqqLCqfpbkat/uYtryXHIkuU3QF9jNBvzHmxzYjLCJsyQYbgEqcCKyIEcLPOyzL1Ah6F
	 8MOpC5lV5w0KeHZkajuzCHD0HqnwzOtnPqGfMZ9wIqLIYiSYb1wEJXJpZs9i899H8//ZD
	 7TwOsz/1YznTBLkqi5hyU5qw3+Jps4pAaD5qHNpKyLGjDx1IXTr4PYZh5CDOmqiuYUuiJ
	 9TNL8FBHDFS8PCaGxlJR2/zYGshCo8Ol93k549KzCQTsOXdqL4y7IjFMmnl98rVLA+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="AaSYN8x/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c+yc+mbV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FA606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AaSYN8x/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c+yc+mbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794917798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
	b=AaSYN8x/4EAJRXV3jdqp2YECdJXAWpMuEeXaT8bAWmCM95o3sKqFPPJIygW0UBizZM9Aj8
	Lp2+lIcGyqxuEHCcdwajdwfJ0ROeJSd5+qtphZ2pvlGGDWN0H8DTdhpw9suUP7zg3kuwTl
	Dya5reKx88wr1a4NlJyRzoA2nfPxZEU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-7qBEJjeZPvmGW82yNWd6LQ-1; Tue, 17 Nov 2026 07:16:36 -0500
X-MC-Unique: 7qBEJjeZPvmGW82yNWd6LQ-1
X-Mimecast-MFC-AGG-ID: 7qBEJjeZPvmGW82yNWd6LQ_1794917796
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c505eecba6cso278468766b.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794917795; x=1795522595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
        b=c+yc+mbVouu/75eH50Yi8Km/ZrJumgrYxr5+Auc5QgDWT4mGnO3xjOlZMto7hM6LjH
         gnYHTom3sT6MiqJNNym2xwS5sSY5vSSV1g7+YEy3x5WfkkArE473etB3/bjV0ko8OaiX
         ODsrt0OlKWIy6iIVbyhHKcI7g/DUN4dbW9PkeLxxlHz8rIqQmLzMBkM+Ce987XqXvQCb
         eEz3+yW0RwXZZMgW60JXHx9HvzJWJswh+hoqGS0tVFTUXnj98ZdKSccuVbPnkkvuQ5Gl
         gKG+aGcmNlZm8CCcxzqJYg3P+U/G6T76UdLxlV9LUxNsOgW3J8Ci5aiHhIIORQ/9L6n5
         LOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917795; x=1795522595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
        b=1lE9xc8vYUVZV5ErBmHSs7zzpav5qwZwXDkUudHjHo5Z8+JvjcS26NA1tZr/L0tMW4
         QkgHawiTNYEsuNTDvPWj1ekFPfjuzb7+2kJkuieG8PbasK/JGmUmJX+yFtEhyfFICseP
         tJGFImR9L4ZDXZw2rpTTT5obxAqtjFcr+7SEQSO8gue/iKuD8eylaG89C/84OAdBxlTd
         +AxfrcBhPnmEQHE/OATbQ65r6+NEyoOwlQYEndHcsJR41UukR+pcI9sPfBZCT+DrCC9+
         57KYzsiU5a2+lCVEvv/Ne35BpeCvwDEBHXUrp5WYLHLDV7U3aMIZxYT3xcPC6LAePs8C
         K57g==
X-Forwarded-Encrypted: i=1; AL+hErFa8tDRaRy+e+LMCN2efWorpFxQaGtQnuul+lYpuYEuVVoe6tW1qTskCx1A8LJ1RaVP5QVmqmkSKao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QxV+MLFEmPMRPOAhtt7W1sTxjVq187mH9eJ6TD0O/jHXQg/Dj
	z10VCAvHqKABiMAMkkbOD5N+AAEflAL7KyPyvUINUjPBPOcquhf4BY8AS7/qnD5G7JyjWNF7A/M
	1vyjpggz/BrjtvXBBzDZ/EhavuSor/YGlTbRMuJ91UDqkljrJ1SF2O3UcQyEO+w==
X-Gm-Gg: AYBFou049WSOuO+5sifrfx/mNnu+1BmtysFtC6c+KYnSgNm3wRix1MZZwaKNivjyAVC
	++HYKpoajfzgvEDvDzcU5QFr3eYt2Ic3LSwPOgr1VJ7KMGk//YJZ7pD0OVCNt6yr5OQn/jd39NY
	uzwjzI+VCe1fe30RXT4+kfcj9V+QyWQYHCE5/l70GgwWJWpKxk8PxC/BK3dyQ7rBUyuhc7f2Gxw
	Gy5DOVfNr3LthLnqA9Z59cQaxGeQYZDOs5GsRMzQNITUHw5hhcocPgOzqWPSSNaTm995XUaywRN
	1zHg1yMeJeyc+rhKco0Bqv378jSpNkzA1N7JaUd9sj7Q18O9Qn+uRmxcpS+MxA3s4ai1kLkhkMD
	CZC3xbFTzRVUTzjgB8P+uEzqaZrxPHJrnEVAFnzLy0lQziKSybeLhkXp1le875cofRboPVWtqLZ
	NQZptu1JtfxNlu4JKftu3keQHauD7A/XwIPvfzRoD8qliS
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr1133543566b.22.1794917795630;
        Tue, 17 Nov 2026 04:16:35 -0800 (PST)
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr1133539166b.22.1794917795043;
        Tue, 17 Nov 2026 04:16:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm3726606f8f.46.2026.11.17.04.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:16:34 -0800 (PST)
Message-ID: <9fec496b-a01e-4701-8c4b-0f78fef2ab48@redhat.com>
Date: Tue, 17 Nov 2026 13:16:33 +0100
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
Subject: Re: r8152: RTL8153 never runtime suspends with link up on a network
 with broadcast traffic
To: Paul Menzel <pmenzel@molgen.mpg.de>, Hayes Wang <hayeswang@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Chih Kai Hsu <hsu.chih.kai@realtek.com>,
 Birger Koblitz <mail@birger-koblitz.de>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Heiner,

On 11/11/26 01:52, Paul Menzel wrote:
> 2.  If the hardware cannot do it, would you accept a per-device switch for the behaviour of the experiment, off by default? A module parameter is surely the wrong interface. A private flag (ethtool --set-priv-flags) would need no new uAPI, and userspace that knows the network configuration (systemd-udevd .link files, NetworkManager) could set it. Or do you see a generic interface for a "runtime wake filter", as other drivers that runtime suspend with the link up would have the same problem?

This is borderline, but I think a a private flag could be the better option
> 3.  Is losing the first frame that wakes the device expected, or should it be delivered after the resume?

AFAICT loosing such frames is acceptable.

Other questions are for realtek guys,


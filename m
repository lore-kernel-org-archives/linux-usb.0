Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452584E9C2C
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610856; cv=none; b=S29Yc6eOa6Y7WGvArG/QoEX2J9Q7n6sISnl6JDpE5Ei2Dsf3HHk6mZQQ7HOdROnGiSNMudv6l5aJTAxse/pDoTYEYZ/kJ8374sEDyfwnKIG0LKiIW7Q3sqjTRCls+90GcH2gGwJquqR7VXoDlG8OmHNWE/m8NtCceZw/IsyaTTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610856; c=relaxed/simple;
	bh=btGCnFhlcQ9Tjp2kCrPOIBm9c9H5F/PoS4B9XE+7z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXISDQ3rum1zX//JPL8d0r0F11KirUhu9nxd58aV+TrfdEAykb9f+Fsdxqa3qHdPF0EXnylOIKaBAKuttm0W9hWi1TSBNrSGe3lhQNyQjPPE16So+hBi7xSoCR53kkbMace/lDAH/BNUwzZ9GNhrVTTtlAQC73EFB5SaOJQ6zps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXEIvKXy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXEIvKXy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2582500f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790610850; x=1791215650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=SXEIvKXyIXNyFGjC9wAfQ0wy7KpcoEEft6qj2cHLHzkCiGslmRG/3MdJuJAd4Cq9FR
         MR6kMsItepCIZ2L5cZwnwFJgaV7Y7mEdsqQqfm9bFETjH5tE0Rvym9wtjWuJwxKMKA0R
         Ics/VBsilEY3UVL8fhPLv7ao9FTAQt5fVmpE0FSIoW7LYDRgdf2vp8fwuA8f1QkZRmIE
         OKDsGnEFRR+5bFfat3vOBfeLWQ+WumxqfImwIH41Ma4PWOOQfGSCTz/hghhCh/mo4b9K
         vrcZ9L++fhIGc0KcglADhiqx/8qkPL/lgvDuZ6fZXQRbNntavrUqMoW4yHhVdqDKXces
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=w7dfMpfGe9FQoNXjZyxzgSkmA/sgCIQauVmuHr4UBH21z/5mh9M16DDDxKWWzQ7KsA
         Ed4dIJRXhbyflbUNOiPlTIRlLKu4KeL9nw3/pDOWnwLphS5wr0D5YREZlAtvXhWnkr6h
         eucN3bYtsLvcJ4CnwGsoRwrp2qV/PTWfbQcue76SZQUSwopaVCrc4O2JFSr0hChi8Fkx
         gmjJWHj3w4d2k4oYmLjcd1245JpWVa0J1N4MvcDoEbmECijN04eLKQPfVVF8o/O7KuhP
         DZbjRocBRAnC5uc4x2m1NhNUfojCFORjy+8bWLkeQBKnOOrODNBaDYGvpX/kZYffpCxY
         nxtg==
X-Forwarded-Encrypted: i=1; AKwUvBzdn1KiZNjQTm0qkmk60cgeODyvy7l4Tg/1KbNt78WVp95L0TcpCGRMkiFnqBHDQaGRTtB2mbf6fks=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL23t8MvJ/3P+BSANsi5Qxw4Tuok60RwWT7fKB//s5CXIKNei4
	ledyRcfYyCQOZSyy8iO+iJDJjYhtCbcDTj/+TAnAcfWSFDcHe+t/45DhIc/rMSW7yTw=
X-Gm-Gg: AYBFou35RnsNd61MFCBq3p5zUja5W8w6tPIxAvYnrxjxufE5VYXWToYimlMf6+oBSi0
	FeyRn9OS9ZnFktjK3l3INd/KM1NdRdQIrO5b0pY6J1GnVJoymfrRUa7sD07xSw2TPUYgeOnaf2g
	PdKkqrHXDXE4ig3x5HkeTjfgQSAyQxjdbTC/HqtoQteXxOdN7eytFcm3xLdTgu+9zb121hLZUeK
	CF9D9ZR9d83b0MtcVYpNf10VrvyjhObBwRGSNTuyzQ/UmpiVqhD7AN7pj8gnsWliMZzSk1karKO
	b6jXpcRmh7LfyHdpi0CI7OrQbTfAhTxTS2llJypPH5BTFMip/OCzg+bLw+/4RVt9b9lJiccgLPa
	PvKKX0x1M/dQmt3ZHa6u9Z9HSM6LM/lHoinrZvL+6WX5Khy5yP0JmnXXOQjGn0I7Wb9HkyLlucy
	JO5XQcXYhpW9mfiNjU6tN1cquFUkOctLtyxnsDMxq3Hy9XNs12eft3guMjXXHOuR7U1t9HsNMMp
	Qt3cN3HJp1/1aFwfNLQ4bs=
X-Received: by 2002:a05:6000:2608:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48884baaf4emr13756148f8f.0.1790610850114;
        Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-489bd7b1df0sm7993153f8f.31.2026.09.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Message-ID: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Date: Mon, 28 Sep 2026 16:54:08 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2026 17:33, Dmitry Baryshkov wrote:
>>> One major comment. As we see, on SMB2 PMICs parts of the Type-C
>>> functionality are provided by the charger / FG device. I guess that on
>>> SMB5 PMICs we will get the same problem once somebody tries to implement
>>> additional charger features. Would it make sense to rework the PMIC TCPM
>>> driver to be a composite driver, taking several components via the
>>> existing Linux interface?
>> As this gets decided from the QCOM side, I'm fine with whatever suits the
>> hardware best.
> Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> components be fine?

I mean maybe. Would it not make more sense to land the TCPM 
functionality and then look into adding charging moving then ?

i.e. finish off adding this piece first

---
bod

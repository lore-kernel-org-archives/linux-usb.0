Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346286;
	b=yKZ9ApU7Og7mU8bWlF4UlgthT3G6D9jUMQpqJdK0SCywcro6o6plo7QWq++mal7KS4Ma
	 nd49PdBbwDSioNvXVzO0v5yH/EkVMYBcbyGBEH+YIKKVk5/vaitjDW1BtCbJV/QvO+PIu
	 etlmCF/09X2cxobSN0KKfgCnCdUkU3taB5W4uEx668yIud4boeRYja9XPdaz04Ts79jUN
	 irhZKXsW35dqyvMG4aoxHkicTpb/iwUrqcbDfGeX+2A2QhPaJXpQpFpar5tsEOtzKZ1WY
	 F7oRvIQhWqGvtl9efQAnyFngFSlNDAY8SCsLkTiSbH6wxLxDjmlUlx0BzweGccn8Gjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
	b=iOyWL3Eekk0ImsdUR1ZOZXS8Ts+W2YS4uk3yhONH2jOt7OVWA+u+coUOdB24pnErZWmS
	 E/dkqNpqcotsGGFiRLNY3D1AntpJtrLgXAIrUMKiHZvjrKTxa+ybA5RyT9jneC6CRJ3lz
	 Y6tmhvz7EdAwxL/gO5tDXB9XMGHgDfuwdtv2EHy+9XE/zxkhCqx34hlysEOlktX6vb42m
	 4NrmQqiX5lQ/t9gNiWYBUKcOn8k67xRBLhQNWeUvOJZi/1RgdXfNPUoiOhrcEB+33Dx2M
	 Vjax3nWCIkTCW3lVdeXcVBO8w2G09Xd7RT2hFljKXJLizpDLWgNewYdaI60RRQ0PUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hesling.com;
	spf=pass smtp.mailfrom=hesling.com;
	dkim=pass header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=jUq9BMXa;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F47606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F47606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=jUq9BMXa
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14fc585291cso306802c88.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1793346285; x=1793951085; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
        b=jUq9BMXaPY85KAuillXqP3Ky2xsgEqkWBAK8BB0yqrWVhs1jH73EBI0oIcquyj2At3
         r64+0a6cyMyieeoQtWm0c0nNJ0hm8jHVn+8HYiE+gWO88amcIAqF3tASBN8XuVcAoFk6
         xAWbnSIQsHER9/fZDOjlHquMWEyBg9ozCe2ANvHwM+nbdqPDMtKIa4TRZV3V46GO4BKL
         sCgzjzBDTJQhFI0vuXp0yoenEB5QWU90GQWYzX08xP2vf7n0sPsiGFPMk7LktMGDvmsl
         +etG5jkBo4dYd9hT+oqfOJ89VMJMrR8HkvQXWmlrv7XDJhyy9DFXKPk/VWhb0OJJKyzc
         3Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346285; x=1793951085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
        b=mo6MsLwagzOq0jjrcBA+qRIXJQ8A801unghb8kHLn2S3YoBPlURvGTMCFLlgHQcFjc
         RUxrtMhwQpCvhL3I1Q+n3zGDoXKfQ5kFhF6y6mTYFyMlb66Lp5Gn4X1QqAqDlQM9Crpo
         cqq1ZPteYu4i6W6ZIkMjGOrwmc5+5F7yqV+AiyYv8igbyGIPlZo60PtfUzF6TAq2Pght
         mhbFlPOwLX4kMtX50W3sUIUPE3RRBuznmoNjpreS37cvbaHgusRVIwZV0GCtk4ypgAQB
         Al2LXwSuIraBIhkbkGM99Yuhp3K0wdxJN9B1UM/UmlCeTTMVl1rDCt4t3DC4BHJfO9hK
         HLjA==
X-Forwarded-Encrypted: i=1; AKwUvBwGY1bkycc8sE1Li521DO8PSikSKFQlJ15QaKJHEcY1I0kenDK8fx5jhbGKFI5Uo/BCnUui9UmpxYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4OPHeVoQwoHqY2dFTmhLO54rKkKKsgeECJubtaHMpLVPguxvp
	p4snTuifIqzvdvLGmuTjgXjZHNHkBsaoRAEF42+OmdYbyXEfvfX9RBVD8zW49Mut+aY0IlBvRhb
	YZxn1pNM=
X-Gm-Gg: AYBFou0SMRVu/hd9mg4THx9aVDkhAPWQxYE0rfDfyevYPtADy+gUPKF+39qQpYXmt1a
	hP6O+aMYLtEF2oTp9ahNlUGDNHGH/6O8sj96Hk6lMXEE7tmtTv7qOJ1v8sNelWF48Lcd5TK8CjT
	I+JzqZrlCsL3uxBgMvXOxfmamAKjrWl9LCyUw8t79mub2O9Xrr7XxuRqCV/++KhoBMkT05tvaP8
	cai6giDcy6QpDwciNEFNq48S/pebucZSicBQ13NMyHKQeNWsdABFQgPww1+nGXCVuVOjlHsbxuG
	wi59A0r4DYhS8uV3aWdezsGcmgw4oZNdcZOVB+7uHwiSix7ux0dZN5lMz9rvNoWxCI/k01aiGgX
	/SCJNi/jDGvyu8PcuXQ2Ux6JA6xvoRlwYolIG87vDJFLwt7O2z3xjvLDT8s2KAcqtqQ3Z0uOcD/
	/69MivX4FPmYnT6ViBgqobFrb+0sRYLoIp5f13Ib8+KG1c5aaOXP7Ze/pDMfHGuTnMRr4y4/HY4
	wEs4cJnnmaPxIDhTvM6XANl+YDWoixskKGNrdsTE94+r3eWkJ/lYGK1JWLPFz0c9Yw5J3Xvy96p
	M4beyJFQi5KhulRZHNHE4h2Fv8qQ2AqwzdJDTddAf+nEVRC8VlIbTEpq7/hfcF69BPVSJAYGNQF
	ISzy6vtey/PhzHr8Vzw==
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr2971559c88.23.1793346284608;
        Fri, 30 Oct 2026 00:44:44 -0700 (PDT)
Received: from ?IPv6:2001:5a8:693:ec00:90a8:f6fd:3390:41e0? ([2001:5a8:693:ec00:90a8:f6fd:3390:41e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7473973c88.10.2026.10.30.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:44:44 -0700 (PDT)
Message-ID: <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
From: "craig@hesling.com" <craig@hesling.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, leStoppe <lestoppe@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 00:44:43 -0700
In-Reply-To: <20261030012805.4087311-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
	 <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
	 <20261030012805.4087311-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Huang Wei,

Thank you for the explanation. That is completely fair.

For my HDS272S hardware rev, the oldest fw I could get my hands on is
V5.6.2. I confirmed that V5.6.2 and the latest fw v5.7.1 both share
identical USB descriptors, including the interface subclass and
protocol.

idVendor           0x5345
idProduct          0x1234
bInterfaceClass    5
bInterfaceSubClass 0
bInterfaceProtocol 0

Updated:
https://usb-ids.gowdy.us/read/UD/5345/1234

I don't think this is a blocker, but I am also surveying other
projects/devices possibly using owon serial, which include an SDS1102,
HDS25S, Hanmatek HO52S, HDS242, and HDS2202S.
https://github.com/lucky62/OWON_SDS1102_Linux_Capture/issues/1
https://github.com/mjkloeckner/TB066/issues/1
https://github.com/JohnDWilbourn/owon-hds200/issues/1
https://github.com/einsz/whoop_thrust_stand/issues/1
https://github.com/mkreutner/hds-mirror/issues/1
https://github.com/scottsun2020/owon-electronic-load-tests/issues/1

Thanks again,

Craig

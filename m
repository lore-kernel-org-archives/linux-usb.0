Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785844;
	b=klnLIpIK7BMJHFcpRraoCZNqzJZnZPlUYCY299NuObmgDcC5XHDclEmzF3/O4tMPHKDE
	 eFFOp7NoKEHV7/JCT2ZoN8DYv4COq4rhbqpRkjHjs+b9Ilt1ItUXZPzNVpswK6nUxK/z4
	 LGt2CLF+PivN8ZHJQLGK/bxuB6V1xd1ZdzHOshI8dwMkgQHQvXyOWtgb73J9NAULh4x/D
	 i7kFqEW4MWLXNzoUHhN5zZseZ60SjJd611H/Wb7tlRR+aNPdZwxB30HHcDbbddW0arYhq
	 js6leNk2nqB24fFbVa1s/g6YthlVnJGy1AE9WYFZgRqXBcT/P9Goq/GWjkCnyRkGbvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
	b=DyRXKuO0OYoMLSZmU2geP5X+CMU0zlcdPqkAZhOvf57yRltBL3Pk+nmcOwGhDeiWkLI9
	 aVk5ImxWQapfqJvgQzrKGQb8iXoOrt/RPP6nOu33wv5iJ7BHDC+x6EYTTfHaSApDTaMD+
	 Q/aqHVaitTlpSIKQGesd8tSxo9DPeMf5Ed1xHMQ22cBHh4S2U14SQkUqi2QrkzGgp2XWm
	 VsiYwOwVjLvtAxA+9eM0LAuybWE+8hGRgGYMhEz1HRTi8zclZaad88Cd/GHpsiPrvBRh2
	 VpBDWJ9f33kZkH5VA58vocx6J9dlXFP0jlViuYfw1HhUvPG2efw+GSuztmU7QqqHEyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBE606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFBE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so11120831eec.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785843; x=1796390643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=QbDZ0OmWb23DeQ6SMsEROCLzRpC9WkHeoy/hlrD6xOTf+ZvTpSa+ESznh+t+jDIi+s
         XYDpDrTh/p0pGoouz1lCgNnxUWt/cnMof2H82NdysfECX+EW+GNvf8LKH/jDyyRab+9p
         F6nKcs/Xsm3rbRln7R3ID0HoPA6bBZOdcdGLsmAgpaELohL3ud0cQ5WV53mn8UFV1ieQ
         0QqGz5lvQNCCX+6/qsuk9gCTk31PNfwVXJYG8s0qfcWEuBtG5VKzF9y24IzOICGfxxg7
         UdhUsy9i2Pz71r5wYPVDqpezKUmUCvzHfox4nYsiZCV7c8K0xsN/sNnohLFlDRSe/tOH
         bCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785843; x=1796390643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=Q6LztRcGk1OTkNhsdEw8KGna1SrsHJB6rIq3gsNsePEXv3t60iiPM7i3zpHHer2D51
         F8QEiDn8koPaJpPtpzkGu4oLoWURjnOCqu0zyrqe1uLxAGFMx3r93QbzcCEVGX6Op2x1
         O10GwBWH7WQU7ghne4VVHXZjL+oMPPsByywKYdfvNjxgNZwV1fWrzxVIvmUWSeIp0DP3
         7sBKUwHvIYlYetk0eqRusVyZZb0UgmeqXU3SiQi29JTgs1vMB/mi2/HdS0YCwxkxb5TE
         xEn3dqROmhaPpHxa1+ehY/W3qia7WTwi5cNhM2omQwdWy27+U6ekmwkZ9uAOElrIpZJq
         PwgA==
X-Forwarded-Encrypted: i=1; AL+hErGj8DkvEuERyRD/KBsm6Z4oZpvHuNAjGQJruUaKKkb7iQf1J9mTUbtqMhQ4ZQ5HnFDNl7lvEo01ERQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9drNc6npk+aXWd2ohlYB1aipPTN/FmSOM8W/Zv/DfdtDle5Tlx
	eTdzsJ4qFMXfrhZ8/nJopDX4PlxZP0o1ZaR7KCMypAnQHDOHPQekYq8i
X-Gm-Gg: AZFdTZcSvQZ+adAyvZ2nXE3Wgj4ePRr9PxUM7fkxbFTkLxNvDHzopH3DQLxfTZQJI5o
	cw8vQ/alwnYa2KUhSLMJvaej6vxthm2fa/EImfAPIkgQxsMQiqLXxEKTtOf8R3UyFv/EaLbRWyT
	p9oQhu/FiV9R+7bfUv0Jk7MYdLSsjWH/yRkSJeN1lOdOCRnZShkLq8jOu+5zd/0OZ92RoWj3lK3
	n5TF/OkYwTSQQpw04DrTB4Iam83hlzhs7f2a3gEDYCada+mlZakKwqPKDrwfaOIPSxPS2An73+s
	a5rnfWSDK65ov9aajkSaBBqnQfMk7OHbRtUcR1YBoWwB5JnZIgkq2eJEV888kgJmpmsYjskNjCh
	uWnGt0Eq07uD+0Viw9Lf5l6iSNWwVV7K1/7ehpU3B5ZzQ91StfxaVT3ScbirP0cdgdp7JzVmKNO
	63Rc21LC2T2vJ66CeJg0XlScYZ3PPlUul0/bOt4HBFEmNdqK/PGvMMaBC9rNpKrf264MNuLPEjp
	kgCp7kfQWUdEjQQDRZvyga/TJ1D3edmBUlMFXTHm1kWs15l7DZWlUFCkTUUZW2w1mOxpaI79SrY
	js+zddzwTJCqKMb9584c0MBO9d7dBFUKSZTSsaLX3MyW4VRKfheg
X-Received: by 2002:a05:7300:dd02:b0:386:9957:750e with SMTP id 5a478bee46e88-386995777d2mr20420340eec.27.1795785842774;
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm86897461eec.4.2026.11.27.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Date: Fri, 27 Nov 2026 18:53:55 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Message-ID: <awmD1f5QbjlQoZiC@192.168.1.36>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
 <20261126093819.76480-2-blfizzyy@gmail.com>
 <20261127105641.16941-1-romain.gantois@bootlin.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261127105641.16941-1-romain.gantois@bootlin.com>

On Fri, Nov 27, 2026 at 11:56:41AM +0530, Romain Gantois wrote:
> Hello Ajit,
> 
> On Thu, 26 Nov 2026 15:08:18 +0530, Ajit Singh <blfizzyy@gmail.com> wrote:
> >    reg:
> >      maxItems: 1
> >  
> > +  no-hpd:
> > +    type: boolean
> > +    description:
> > +      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
> > +      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
> > +      asserted.
> 
> IMO device tree bindings should not describe configuration procedures,
> only hardware. So I would just limit this description to "The HPD pin is
> not connected to a usable HPD signal" and let the OS figure out what to
> do with this information (in this case, treat it as asserted).

yeah, sound reasonable.
Thanks,

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

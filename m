Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678577;
	b=SblNe33aTBFb12y2duevpVhQfCi/1r0TcEXAqHxzI0QbJEPhUJ1+jFg+5yXca4iCojPE
	 Ty+klCcvAOsn7+lyXaM6fZCbpnmA+wOGy4yRqNu3667fs0JA3uitPQSZwybwF8P37wG86
	 YordTWD4Q6tZZ7JEwsmVi45+iKLmk3Cau9O6rKsELgMkJSt2QYAuCkirI84j+vz843/xP
	 unDLh6vvcmIvhgWVVSObxUneHindz0LVDqxOiHOxc4yG4XTYFNCHCcXvfPsjCeAiR0c8C
	 PK8lveou7CRXjMTMxsEMorwhaniv1pL8DQT/6/DNaD+20nglIsYinmJhoQp/vS8NUvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mFYcI2p9CMbhYv1VMrFbhKdF5+72hZmpTUJeF9tu+Ro=;
	b=CpZ71I8ygkKQNpcsrqkMXsSl3keks3DyfEK+8QpKxYjxfNtIvsl5MyN60FgF2dgMKQSt
	 rHuUL0krMCp01gQ+FFae2avEUShRA3LllUEiFaTn1vVxBbdP8sKfGXUMbkYXiJGgCYyp1
	 E9VjTLM51xEVnFdLYm57njaiiOBgc0nkCLztqP06oiH2ggxrngrOrmk7SQqU3hTSrobix
	 BE58FVcjHLOhDEraRC/kDZMKpqub/x2pVWmF6zQgczp9CZfcblZ5iULpCKd6ydDXW1bGv
	 EcEDYSNqzs/zRqxITL/EPQx6gOZsBPvz1Ou9ZS3K4XaWGAAZ4hL8T6rOfdktQiNoyJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/lH4DDq";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA78606A334
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 17:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA78606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/lH4DDq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11344435e9.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678575; x=1795283375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFYcI2p9CMbhYv1VMrFbhKdF5+72hZmpTUJeF9tu+Ro=;
        b=b/lH4DDqF99mgnVXp2T35/K8wRAYTbgPufJ2nGABQthQItbP5LlEhMiJ+PnRa0Iu0R
         1pRmHsPnrol/oYzrBo4NIplxdbjktSWzPHsb6bjUacrKQ5V+XPT++4NCAbm0tys/G/ts
         /6Y196KQ41JTKZCoGcisFUjOLNpB1Kpl+IfE3QCeumZRrdLoOdDDn7edJ0gE2APQJd4D
         2ahaI5Yjod033DQXdKA2g8zFZ8DoEU5Y5TzcDp32NDMB7tt135I0IB1OUSUWGjYEpgGU
         k0zhQprNq3MLjenVRMQVvssbH90cAbPWgcp5ZbEmcMLiIrLBz/o1EKbyUlCwSqNZMSSR
         8JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678575; x=1795283375;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFYcI2p9CMbhYv1VMrFbhKdF5+72hZmpTUJeF9tu+Ro=;
        b=Mp3lge59LumIKmjEoIokAraswTyRPxL2sAhdzDt1Kb3Elx3a1Kw2118ikeJzh1O7nl
         NUbvHbTvMzBnyrTLelxuHndXII2K4CHerN9YFvLYYH5DK17yrgDlGniD2AVjOA3hifhp
         SlQ2qav44g56DWHIXDGzK9bsXEgw/fD+iRBiE+J6oWXxo58h/NQHnsqJdDGEzIIg3sbx
         kY488fLsQCUlLhaXm5nDz8oqMl4rVJ6WQiqE+dgMVU5WcCJOcahD3bk8dtNpx7YbpUuM
         oklQG/GYRONyj02fw3Ey9/6PtfixSKroUqrtr+ApBXhgWGfzdbQXb/KOSOaTLEIyQppx
         kneA==
X-Gm-Message-State: APuU4Z++8h/HJYQEKyLMQsXznSX1OSoMISZCqrfUmeg+JCuM+fEjI/Bi
	X8+aJrxTX1R6ytm7zn/ht5EegrMDNMAMBVbn3uF8qFCBhMYgGaeK2Y+T
X-Gm-Gg: AYBFou09Vlq4JblRhIrJmgpRkjEhoFbsMvSZX1fNq90bBM2uJ5kB52DPjHQPqJ9yw8C
	mLyl7y/+8aBDkafoD7Jro249oQ9TULEtG/OsAx0+oO4D1rzb68+3EpQEzLWNKaY22tGk1A/oeGV
	bQAgm0bB1ZNEkBWiZI8IdarULgFZXv8H8KqyLKZhkE/wm09udPfF1jH4/UHSZn9hO2t+0k0a//M
	CAAdDuk0yevMnHMrbFh9qZ2A+RxmxOCRDQESnmjmPYc3X8FXxhCps9vJ7pegUUOOEgqXh4xLSth
	Bj3tiOiUCqt98ThyPsQzNBmIqqPHwFvqu0PISrSZHE9uLVsqioRL98ZnMK8B3yzlA1Sx1HAQUoZ
	t5ifXf2Q7MEqRWaDLpUv0/ZuKRP5Uv7Q/KPuoAexIml5DMMV3Rm0DYf99jmBJLjbnPjRseSSx3A
	MMa1/LuTK1XgHyZ1bbHLZ1DO+7fjj3R8dakpy4fbIJJwhbvyg3wNGE5cxsV9gj+9/A9U5SNN/fs
	TMJ81UbaT9xm76AeENRTY6yj0BRzba63jyc0V0gdf671J3ZxViMxzDm6vrfMjFJTTX0NvkNeOym
	sJKOEpiClXhtnnZg7Wgeatt7TtKFTbo406R2z+5g6BAzzvRgqA4Yn66PC9BxlNKYZCjCilqHR4S
	YriYltCb76tiPb5H57DgK8EknUBblmG0OkGEO/P04p3AHRh/IBFQXRsCeIzaKtA7OtC1c9nTtZS
	kPPSt3By1Cvs6YVgsRIuOxjQBH3ucO9GAzi3uSRVTog2FV/hTMpThZM1j6708c7m9PZUjeUjwQd
	cxcMs/B22g9RGJFAB/3STmqHjVmAAc5smUOTSGFh9w3fWM7Kw==
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr91693235e9.15.1794678575388;
        Sat, 14 Nov 2026 09:49:35 -0800 (PST)
Received: from localhost.localdomain ([2a0d:e487:413f:168f:fdf6:7a1f:cf13:6d8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm20611250f8f.44.2026.11.14.09.49.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 09:49:34 -0800 (PST)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: eddie@ehuk.net
Cc: linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Sat, 14 Nov 2026 18:49:32 +0100
Message-ID: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: 578d6cf8-264b-44db-8610-59848683ae5e@ehuk.net
References: 
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
Content-Transfer-Encoding: 8bit

Hi Eddie,

On 13/11/2026 19:32, Eddie Chapman wrote:
> May I trouble you to say the product/model of the Orico device you have
> which reports "ASMT135x" as the iProduct?
>
> Also, is it still running whatever firmware it came with or has that
> been upgraded?

It's an ORICO C10 — sold as "ORICO C10 SSD Externe" (4 TB, "800 MB/s"
USB enclosure). Stock firmware; it has never been updated, there is no
vendor updater for it that I'm aware of.

Identification details for the record: idVendor/idProduct 174c:55aa,
iManufacturer "ASMT", iProduct "ASMT135x", bcdDevice 1.00.

Note the model is now discontinued — mine went back under a
defect-based refund (reallocated/pending sectors on the SSD itself),
which is how the UAS breakage was noticed in the first place.

Hope that helps,
Olivier

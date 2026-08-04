Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D6442FBA
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838232; cv=none; b=oyRAJVuaILB7q7rEfv1fe+8dtXa+Mi9hBvaG/mHiuf4d7yy0RLXKkkZnia9lZs8Kja1UNq3Gej6FSNnni+pSgUgS4ipUQV+yDGaDHoJFQOeok/wW4nTtxalfWM89GYInKF3Lw37LUNapudTGgOUbTQiFF3tb9REkCq4vKamihkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838232; c=relaxed/simple;
	bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEki7GyYuCxIv4DWvvVq35xCRicTBUnk7Ofk3F/qh0U8Dx4aUdD0fiBYo94q7ZhXFamKmOQpyZShTK55B0IK3QkjNG+YEz/Gd8XD1rhH2rlTyJPGQ0S97egCe/Hxqp7PLLW7ISSnsJQxGGFAj7PeE6b25ycXoy+IbqAZghKSsS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsOnGbO8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsOnGbO8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso5708547a12.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785838228; x=1786443028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
        b=bsOnGbO88BmEGijCblkq7pB8DXI3ea9/PSuNsrS1tBwPey40zrDK8x59vHRK5Sxq1D
         lW/+VSqzPVjJYx7Lc7X7NU6MnL9FeA+xLwEZQklBoqc8ty9Od6jHX7dwyyLFtlxDYNA+
         0yqkB8GorK1Cn5j4mqICQKN/4GlmltEAeIGaChNq73DaVu1bfB62UQCIz8k2LXUGP+0B
         B7CCMSVcgvl+EpZbVU8iokIcgBTNdqRLIsidmKz8g3V1/UA8QTfOSCBkzLlmH2HSGcbF
         bzVx3A4SWSp4S56jIxV3sM56pxB/rQKf1UPT+UJL4wH4ns3uK+ArYu8uY5St5/pdTTFi
         vuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838228; x=1786443028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
        b=PJRNNPm8RBNy7biDsqSIxY216TlCQyk4Kw4HM9WKC/BP0ohxDFLxTIvYj3w87iaFSc
         0G2cvhIy1VPy6IOcPm1k3pB/m3unLa2ZeRICcAFhLg5/gc2Byms1z7W7TsPFVyd9YERp
         vLvkzwrToaK6e80vsVo/ln45zT5qOrD3jD3U4AFhqDN055KmUYqdmExAOegJ+XqGsh7k
         BrcQuniFBhs+OLb7oVTGjdh4KypnUF+RqENH86QW8oYs121mXFbulk8yvRUiIQkddrBU
         rfdYdNJNiidGPPMy4FrLXf+h+0iZOal7XSeQFsQ7jEKm8xm/XxpSaIxsrOpitX8VZC+L
         d+Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rodlay26PY/xI53NHEWOFlkxNKo75zYx3tbpt3B8ro7Bm84fRitS8w7/nVpUNYMOwPUqbpaQKEZ7yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPn6sDj6Ae0NHQwoDEDr0ZkjMMol6eo0MLkxR7NxCUvP0bERuw
	SZ/U54mqwzzMxcVxaZ1wackcdae6lhAeZdrokLiONwojxwW1tdcp/WUc
X-Gm-Gg: AR+sD12+u0S2hmznfkR1kpHtz7YZNVl+1PvumYuGAgW3xrKyZ+cxZJG3JbCdbXJMlvT
	H9LFh4fIj4SirpegJKQK6CosgmZVHybZo/Gyy5w/leoghuARdkrTWz5CPZVWH2Hxc2zYT9WpCVM
	HSiJWgtb9Ib1SChwPHr5QQIEHb04Dbr4/TEdJx9CIAT/KM7p/WKaVgZu1FgVpmbP139S1ExUJ2R
	YwmfQts5kBO4USXy92cVi+I9sdJ3Ed5WAos12UavZ1T2/s0OiH0K0P4sFzZVCJbI2PkuLt4HKVD
	8XJFNJ+TtUkzz4k6b+ZaaXAB2Tl6Cij8yY/QX9VkebVfbwnvz5fI+ud3iVNsl/W7/2tLhvrjyN/
	zMfuUKY4iRdTMpCU0Qw+eFFMGtBy16WoFTuMlEAIp89jWb4QMSOskLJ/GLdacfRKyImRZ3z6N3Y
	6gvFeK/83mTgPDGUQg5LioDT1HqIMjhfNNE1N4EkAqXJfJiRj3poq9UgZ0
X-Received: by 2002:a05:6402:4591:b0:6a0:a492:1f46 with SMTP id 4fb4d7f45d1cf-6a0a7c61027mr11459221a12.8.1785838228405;
        Tue, 04 Aug 2026 03:10:28 -0700 (PDT)
Received: from [10.0.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63daf7sm6419448a12.18.2026.08.04.03.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 03:10:27 -0700 (PDT)
Message-ID: <a532b34e-ec46-471b-b755-b60cb16a7dda@gmail.com>
Date: Tue, 4 Aug 2026 18:10:20 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
 <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
 <CAJZ5v0gXtKEaNDdSRqd57zg9GbFN-VDHrU5-=EEQPdSa9Zk-xw@mail.gmail.com>
 <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
 <1da0b5a8-336c-455f-9098-a8c834721039@gmail.com>
 <CAJZ5v0g6He-X-C1Ctr4nsnL00mgLiD1mThwyX2jhUj9qKV12+A@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0g6He-X-C1Ctr4nsnL00mgLiD1mThwyX2jhUj9qKV12+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-04 02:51:44, Rafael J. Wysocki (Intel) wrote:
> https://lore.kernel.org/linux-pm/5120454.31r3eYUQgx@rafael.j.wysocki/

I have tested this on v7.2-rc6 and it looks good to me.

Thanks.

Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EA4825DC
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035063; cv=none; b=l6ypCWza4NHwIAlqf3/keGXLn4ppPXzF+pimYGu8gM42I/o5jHkRDz0zQhkDVGldh5HVfpXogfVMPCB3qlUxJ5+o4x4ZD4t9eTjiPcMfx1ex0Z9ljgp10+qcs3XcLKq2dx9jforNeymYx9Hyp/Hrvyzk7/YO1SA0EOyv7+wqxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035063; c=relaxed/simple;
	bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPvZiMWI5/JN3xdBEX1hIsgojBePM58p1as6ATfJYjULg1paN+5dCBVZztoR+USW85bm27TUi/gZ/ymLqTWECAq0RDTZMsUpm40trMlrvhlcJIGEXvzOZrvxnUNudqY7Gj65F4gXPLHosHqjT5YxhIWo4zzsv88ZrteYyIK8uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZughzlR4; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZughzlR4"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a34908so3180206b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035061; x=1790639861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
        b=ZughzlR4wEjFFcYd1dgfTfM0rCk0M+Ag/meEzUQNIz/DzjJtontU7z0HvUO2blRi7L
         EZE16AAG8wlh0mO7ajaA0XvGq9s3/Y+2g2/jjFSEQV3Ah7v5AHP4USxl3pMc/53VpTyD
         aaLr4M7/bHqdbbwhx/12Iih2sEl/uOabUNwidCKbbGCK3M/cyCEVqtFVDjxbPMqCXKc4
         Mr1z46X68WDEmtyk6USa4QRLrGyDBf8gRIa8p9fk9tztX2etO2aUvtf0k5GdTWanBEE3
         fxASPqnevuZtCqhY3xOhheSDZeuFqI/8xde9/WGKy48kxbSI4w9Jov+6NcQW5nVIPxb6
         dBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035061; x=1790639861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
        b=ncdn7+NjfSGA/Tfm2cmtxUc0JftKOa87IE4Xh+MYxrZ1Z3DM74mO4xDFzzRVBxtnSF
         chFZXaByZh7DesGQgeJdpVGXmZWBUEqC36Ij7kYppyau3nAsv2DM92zrVUbrC3Kaag/q
         2vb6AFEBqSRs0lSQlMX0Tg3H4B7WkglkIv5mVWI2Dkk6UlokZIBiSJgxifyVe6uZ09Re
         EXVIEk4+uM3PqBkgsLbvz5vM39c77y6cHXFUckqt5dg5FSPqm0xWZ5BXFY5whX9+5gvw
         7eukaIeFfcDuftaLErW1Emk4w/FyEvzOxwPZfE5DhBjdfcVV8V64tCpjoqdYbxNMf3fl
         6OGQ==
X-Forwarded-Encrypted: i=1; AKwUvBySMhWSj0dTANm01jEm394YfcvBY301xlBpR3L129wzPtL+uMExXEqm1dp0wopFIAX+n4VG59Ke7uY=@vger.kernel.org
X-Gm-Message-State: AFuF++lGz8J08iuVe27OBw8VRHOshkNAwcK1D5KEWYxoLGB6qm0Pdk/m
	mrmZmmZ98vIBx7CorgOzZAWCW5GYN7dIsH8l3gtetQ32udLVuiS6tVgk
X-Gm-Gg: AYBFou35GyJAe3DdPgTWTmtUNSo36okHvH5/M4Rt/hX0JTSJOXPM37DoRrWfl7DTrhv
	+CtDaoQadPxNjbRMKnCtMY/MKQSqNBXutjUDbQF6haQrtyvlWhGZfg3VAtHlT64QIUI2AgGymnJ
	LDSa+R3q0OB4zEGwv7/aikfk9dTi29zilMzkNLr/XhMo7/trUhkN6tPYrBcTVSmNIg4izP5dS7H
	fKETIInFgJbRSlmtJ4c+6uSIxrSpGFd4ukFdS1zkKqtBfuB7UmePzbv7PZU4BzuBfJrBPWr5wYp
	9+RcmKftRKJ/1MWcwZvL5NuA+ELV/as5ehE3AeoNUOef/OIAxk4oCVMdkXH1+zkau3w6lb4ROjD
	hnbIcl6bLiVydSrI2+ArDBNKGBIGT5eSKkNviH4q9ci5NoR3iTk/RIqZ0LfJhiYWNTM+bcZdCKy
	PUwq7eRN5ntoKfxLXckSmwfcCEUxvj3dihTB7AbDGAxXZNjsLKimW0DXyeEJW8sGk=
X-Received: by 2002:a05:6a21:a510:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3dd8c3fe2abmr20429703637.6.1790035061042;
        Mon, 21 Sep 2026 16:57:41 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc754bc9c91sm88077a12.25.2026.09.21.16.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:57:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: liuc63@xiaopeng.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	liuwb@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
Date: Mon, 21 Sep 2026 17:57:37 -0600
Message-ID: <20260921235737.5666-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921072551.3708191-1-liuc63@xiaopeng.com>
References: <20260921072551.3708191-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 15:25:51 +0800, Liu Chao wrote:
> Fixes: c47d7b09891a ("USB: audio: add USB audio class definitions")

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

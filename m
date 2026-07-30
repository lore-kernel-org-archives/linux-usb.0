Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D029346AC2
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785446165; cv=none; b=pCRPCUKw5IsFMbL2wO/KKK3ZqU0DbHkgcudMzTyPPs4eMhBO+R8lQd3y982gyyemKNdm3N6Q7vE51g+xVDgVBXHOOeuqF3SS42qlSb9e18Ld0zBsMSNmW845HxyfCsk0xGjtVSt5wknunQKLNJwsCxo8619n0H5n2HWpJGkEvZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785446165; c=relaxed/simple;
	bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQG4mP8IQc0qiHCuU3JAfH1CZ4kZNxs6ZxwBYDgrqbCAyuM61hEBEUzM5lKSHysFaNkvPIO4yP9vOw9n1W0qmIgYxMxDy59HRtrh30HjcpAVbOxKxxEOfzeKvykFUb/7zLkH0gxr2JA2wBNRY0/ZiX70ok2Ufh2p081+bFm/QKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdANWppI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdANWppI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so238098a12.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785446156; x=1786050956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
        b=gdANWppIZaHHVrO4NaZ0vAnYOeETJRqHszRJALyTxCLTqgXFXrtYSNK//frvSJEA1M
         3XJJ9haOTo6G6TFEVFdIkZaz52Q8g5dIQV2bVosoXWU/WWUFW/93r52sljYl22mpBKl/
         2MLJqA4PXP/ZhvSSifBMiJxZWjtupSytErT1RK1s73DP0GXqpIkcM5CzcKqA+eoYZkU1
         8HpTUNx7+9bcYo5oBcQR8sogLak4n13pvrOpuY+MEVc05W3e9bhnbfFlWDdj5mvoouCI
         HnAYRTRyxcZIqKGWZbU3wEQlEpc7dIhx8SWOIQw7iUrd9xDOnXw6dWZtVg/1OHfI5+BD
         2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785446156; x=1786050956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
        b=DbTeDV2SW8U6i1FQFI8T9JSXjxXDrd0QCa1MfmdkRgI0bv3iWvKjn55R8UP+Ug5TG9
         GRN2FISfJaZc74r0wJmSDegCqIxCmVMoCZz//FZLN8jo3HrbBRvCnhUpLbBq5u28K2jQ
         lZTRvOWrz9UuoGadPdk+NcqNtyILk/J/7vn9kWZ9tA/mlE6droZaThbFxg+BsgDxVtqP
         EzR1K+XkklwVviUqJzszBoZYQBWwpa8y2A5G+3jvbz0/MkqeB8brkKUCu27bzyOtExUq
         ziaOs5KWYSDxYfxnTiDsJJEoCqhRkrsuza569rFQG+Tz3XZqPWmvQk15H5SWTqL/8Lyd
         sxiA==
X-Forwarded-Encrypted: i=1; AHgh+RqWrnOiiD8DSBywcWQJv46JPkZsFFbuVmGUh9JHG38eJMEFaKbTYN9osxWN+dqvfeGO+3nalmk9niU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BTz15vAuo1TgIkXiqRsuJwQFhPJpi8QshzZzvOzwuoAwWKSC
	1VQXJoGimwILwuuTKrAn9WidFTO1TOlLlpDZV5U8/AW4mG/TrsL9CzU=
X-Gm-Gg: AR+sD13m68fad3Tm7/jOqnOzaCH+LLWQGHxQoI13GGdom3t/TV6x87ByznbllfUaVON
	BMeYFdof+1W5CgX+VD0faGM6KQyOtbRV7anvnjcsdLP1hnyeAEGfTRCfQ+QX5vBFBlLq85afcjM
	Ws/j0eB2RxU84wxxqDBmttdLhNXO8gyd62eFZwKhspA/0FxSQ0MV0f7wwHqU+wcYrGZ0V3ALhqx
	izdP1lxShB899HNhyB8wXPzj3s6zmYbtlEMLXDbyx7g7JvlYSd++FpM+XzCXM7mqgEAPmVVSNWh
	XosD+iEVH6VoZ38X20Lq2HP/YiPlpxwu2rvjliEJjo1ryuKQy3quvIAY4ulpFJtxuWYuAkbrfwf
	mmZhl5BvM9opTerzkRzFri7EMbJsec7Bennckj8ptW1VLw5d29UAVfKWPkWRYkWCi6xuwKWNWy6
	mwoA555ntVWwSltyRGE8N16jdJUA2DkjYdQUTkUWqzritz9vDDu7qQ3GiJhCWzi+3VCQyWz5swC
	sOfYgwiKpVoPD3A+5iUk51LtAMIbjGdq8evqA==
X-Received: by 2002:a17:90b:380b:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38f9c0abaecmr3050277a91.40.1785446155807;
        Thu, 30 Jul 2026 14:15:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.221.78.187])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7263cfd9sm36251186c88.4.2026.07.30.14.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:15:55 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mingo@redhat.com,
	paul@paul-moore.com,
	platform-driver-x86@vger.kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	tglx@kernel.org,
	westeri@kernel.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [PATCH v5 2/2] thunderbolt: Add device links for Apple T2 NHI
Date: Thu, 30 Jul 2026 17:15:42 -0400
Message-ID: <20260730211542.1422-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113209.GF20844@black.igk.intel.com>
References: <20260730113209.GF20844@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Agree. It should be preparatory patch for the series.

I think ur ideas should be implimeneted AFTER the patch, because this
patch adds a kind-of important feature to T2 macs, and well ur ideas
are for code quality, and well it takes time for patches to upstream

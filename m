Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9A35F8C9
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376250; cv=none; b=lyYOx6dzillN3Aeukl5GLtfXWLYyW9WA7lsAjvgL5C5Jnp0Ir8MddpXi+y0Rl7k5cgdaFIfJwE/rIztp0ZkO0iVUe8gw2wIZ0Asc/m0hxI4NSA/zhh3ywtdjZqb4iVdR54x/OR+2yHGYOnJ+kGFhbGfe3BJQaMqiqprCnXbcOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376250; c=relaxed/simple;
	bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb3DlTY9sHpEe+o9O75FtHkDeXJz6Ub77frmoZRSBjnI+HKueOkR3nITcWzPDfrLSXTIkWm/UbZspZQ0VIQGz+2E6QaSWLTIfHRjHJoUOBXubtmfm6tv0tYzM3XoxexcTNwFpA9F7gfPaCe2sR9b16PkpOKSex7H9WD+IQtLZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Ji1gaZtJ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Ji1gaZtJ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3318367eec.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792376248; x=1792981048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
        b=Ji1gaZtJEp/1uK1gCSaYzNSctLm3210xuTsvphqPvtrWYqsg84IMWG6Dei6f3R/VOc
         uxtHffmtH9WIX4yZ/tTW982pkisXW5Ab+dHdyYtC4eZgfO4Isq/1bEPICQxN67+NAPMo
         sA9/7f8GrIj/TNGP+52oDO/w974N5E5lkrhGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376248; x=1792981048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
        b=nRS7GVUhEnglfixB4FpN+ChzpheJ1HzWk4SxV2x2jLomtlAxDuc39RffUNzJb0CHx7
         A8I+P25R9jAaJq3EsbnqXl6uvwHqSg41Pd8W7YthP0h7U9GItc7u9XGms1QSIH57vF4X
         C2HWxYtdn/FRIaRgRL9enWm8Or4soMSzmuGQg4IgTBBXTh3YXe5+Pt2DUGbsUU8A3sGq
         NjnSQkMpn+YavoRUiXatC3oP9dSuC/pQ3NHf3t+eCrn/2HFhxP4Z8lzjfUvLgk9efL3q
         gcknt9r5iAOl6ig713fPPzLuI9Y4IUlZP1ZmemR4uhsLc880GKrlL0WaUfYlGXFuhBvK
         yu7g==
X-Forwarded-Encrypted: i=1; AKwUvBwhmkKjZv3el/lsxp0CB7/IvaePXd3p0Pp4Hil2gCGNwneSQAZsUEUyAOEY1Ris3rkvgBZzPa60QBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2TAOYPZh2V+wmoEb/8Eh1LGKj70IJwXOgqwcSWb0HXkxFYnli
	50d//8G36VLtSJnFgduDJ3AAacWf0tdY24FWlLKA5wd8c/cEl44KcKpg11Ch6W3l3Fw=
X-Gm-Gg: AYBFou2UmIjxaE/o8rgsV5jWUsRh0nSdoLuY7D9GrNeokGHhWGTfSm8IF3CkHuvVrPF
	Z2y3ShWiXy/QqlIg/XVqWVkG/nVk/ilAWOgaX2wDAJ6fvePwlSWkv8CgxOjRZuGxkinnix222ZR
	oDkHEQeBvDJNdRGbxpuZoSdCPugyphrFSc8uAVareVm5hpblxU0vSvWV6Bn+FrUA9WLikmzU3gY
	gpUhwhWVOqHK6SmL9AXWDfWX/eaPGGH4HODVb0F7RhuxaCKRXSBlCyKbm8oHHvQs2azaVXpxVKj
	SyFgMf+WC/nepUCm15p/JDdROEQ/mnSv4Vl37iWrcRGfLxkhbVnGlCMY9jIvPXtNB0ulp6TQUzz
	MRaNo8v9HTsVl3eK0GUEHVdTB4LbXVvmoKhXujyTqMQMLOmWoLXvzav9gtOqv4Wto5QNqhjIvA4
	cHNcrTcagVzLt3wXCIAt3Q/fl6WPipo4MJEHw1SVvFxDBlo1Tx4qD0tihuQDeNlkJHA/fO4KqX+
	sHBheLJMOwHcRrWbool3BnvDbljbm11cbvlgrYUcBG6AaQ0sm75u2Y=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id a92af1059eb24-1876658f6c4mr5983797c88.6.1792376247926;
        Sun, 18 Oct 2026 19:17:27 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm25766382c88.1.2026.10.18.19.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:17:27 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: andrew@lunn.ch
Cc: 98lawweijie@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	law.wei.jie@gt.tech.gov.sg,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	woojung.huh@microchip.com
Subject: Re: [PATCH net v2 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Mon, 19 Oct 2026 10:17:13 +0800
Message-ID: <20261019021713.150059-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce3a8add-3bf2-4507-b778-a0f8a10370c7@lunn.ch>
References: <ce3a8add-3bf2-4507-b778-a0f8a10370c7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> You are assuming reading registers can fail with sort reads. To be
> symmetric, don't you have to assume writes can also fail in the same
> way? Should lan78xx_write_reg() have a similar test?

Thanks for pointing out, and I agree. This will be added in a v4 patch
request after the 24h cooldown expires.

> If short reads can happen, bad things are expected to happen. No need
> for examples.

Will drop from the commit message in v4.

> This belongs below the --- so that is it not part of the commit
> message.

Will be moved below the --- line in v4.

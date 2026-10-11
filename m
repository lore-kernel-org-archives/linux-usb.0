Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8A3B47D0
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 06:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701816; cv=none; b=bcbVLJML59bpNQlwRWMeKPQGmBEEF/k+lupmtA67Xr3m4wHoVPNNRtKR3o1JernmO3hdQL0k6ySIBK1uuMkvg+0vBsW+CBYzKtHQOLVTLho1n4NPrGqJebC0pobeKThaV4+H2cAI54Yjv3hNb7Fhs4kLM0hFHF/fNxENlidBqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701816; c=relaxed/simple;
	bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOXxXeiwhIzIS61xQHeUxGhbbpcqTyqoI5ir0N3PiiG83UKRJZlSnEu4pe9KNW9DrbofsssLIuk2CvYp/ch7moxFmVfE/Oc7bU3lAcnA+rV4OdY9qvperF5F91YnGD3zSrwoylZrENzwnncYxXIJSLkBXAS+r07fNHnLwmtXW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBk9K/Wf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBk9K/Wf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso6001635e9.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 23:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701814; x=1792306614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
        b=cBk9K/WfUDTDljxiQKjOwDao+XllpcUQuVHUSpW/ya71y00FVbBsCghS6ADRkKpluF
         yx+zz1fZmfeXLOa4g/KohzfUD/SAmZSgjH9Mg1aW3dutUKiKfdZyGxnUmWESdhDMPVD2
         6FjNxSwNtpKToWcR/LGq8AlPnqxR5/Ypwlh/c3wb7XnJIEBL7ntDh5k3qh4PQhGcADl4
         j/1aaqxDqaRyZ+DOj62rCmg0pe+gmhPd9rlCzMnylhL8YQQNlysMu42ITrjxj0qDjzRk
         PibUhqlC+F6U1ysE83cjHJDQjx4dTFeNHanIyW5Ic5OuUDvaBvvHki1RBGk3RVOZKjuT
         5uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701814; x=1792306614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
        b=gVcc1sQDnQ1qJkJnfgzDXuV6/wjBLjjJWyPdes3M77smi3ZorCoURV14ZsqH+ir8vC
         LOgppazauhMGfA4HOU1DukwjLArXd0ohn0p5vt47O8QMb/YCfTszmBZWivSkMtOnFysm
         oGBPozarN/7ZAHB2jpRLUHxopDZbXjaH7s+3DlMegRuAcmw7QWKO3HI/VANa8feqjesS
         dZXiYzfuLG4NKdtj4toYyykaJamLYbfXnhtKxdN9MTPn1Blsiwzk8JFNGHBlCfvNdqiU
         QNnjjKXzy4yltlD70hT5fAaKokBEBlEjAzU48b/WazIb+bENvkoS8F1ZW0R8nvvzUSQu
         AKIw==
X-Gm-Message-State: AFq9FYLw6n/rOTZC1Ju6nSKr134feRYiEbOEIq1fO0ZPAio9ElTkoIyz
	nrY4iGgfIj68R+8NP6oFGh+/aBz1vvJvA9TRNrk0QVkvse7VtrcGinp+I+h4hmnJio4=
X-Gm-Gg: AYBFou3mkFPMvM8wYVFCa3j5vg7wgAnaIQPTmdj8dYD0yX2tCyupJeeBH5VP56IUsEt
	ivrWFXVMhfvW+IrjW8q+XuDhvGUZ8R6XG4EfD0yWIPU2EVjJwlHIffMCJz1R03am9jI53q3Ddrn
	wXwHKyXSNbA2oMNycmb7LvaT94UklQhle6+mM1klXPjhA7SQZhEPI9lCwV5aijaclyWdalVnkoG
	6vmi5lbPNrWUJaotH1IP7Cv6uhgF+DkFGYCCUuoBj2MToyKu8oRNUoNO3eZOHqE6mE7wVw3adWr
	A0zgenn4Ey3X7E4pxQNgKR8QRSSEdk99EDr6SDMTto80imAG3WVuCRa0huQUvD2B0KfV+xAlecc
	ig3vBp29Cit4Fw+WGQ/d+K3En7yuiMrvRyPJkJxpv4o0vL59SJZuzuQXmqupRBrVZS/X0YWkQq2
	2qhTCOM2jTTWVSJzQiKZabw2LKsMjsgU/i8T/UOmgp4gf6W6aRWC/TEgXRkZ5YiazB35bZqzA65
	K/1RovmxOQI5W79XvD1Iy8E4PCj+he2YBOm73E9zwWISgB2tzERd1HShd4wsGiU3f81lN1uqhhx
	79IuF2YAYx8EWT0e
X-Received: by 2002:a05:600c:524d:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a18e446461mr123133175e9.3.1791701813668;
        Sat, 10 Oct 2026 23:56:53 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm257500135e9.0.2026.10.10.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:56:53 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: keep SOF interrupts while a periodic pipe is due
Date: Sun, 11 Oct 2026 06:56:51 +0000
Message-ID: <20261011065652.2374071-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915081724.25637-1-orgads@gmail.com>
References: <20260915081724.25637-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

A gentle ping on this one. It fixes aebbc7d63407 ("usb: octeon-hcd: sleep
on an hrtimer for far-off periodic transfers"), which came in with the
usb-7.3-rc6 pull, so 7.3 will ship with the regression unless this is
picked up: a periodic pipe that is due but could not be started can wait
up to a second for the next SOF.

If it looks fine, could it go to Linus through usb-linus? If you would
like anything changed, I will respin.

Thanks,
Orgad

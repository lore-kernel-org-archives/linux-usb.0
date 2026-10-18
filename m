Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27D48A8B8
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330177; cv=none; b=RFNyUwTs5PSfOTfzUis3J6ETSln3F16o+hbSbCkOE3TQIrJKE5iMXt14c16gXb+wFx2Gl6wgRhwsb674zqiCS+WRWy4/GUbCdwYA81LdKzrKzDH0rrEN2NhJMKNRA3Dwmuku9qu/rdGrC7ueUTESy8/1/Ob2sHcCZ0shvJGQHEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330177; c=relaxed/simple;
	bh=aaZ/xfQMHY9Y0WooyFtWFJTJzmhk37MWsnb8cA317rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZxoj8IZCFPYN747GMjfcu5b4cZY/khB7hPc9S//pfCq33MGDSIXq59Fqdsqlm/hTgBoFhz8gFJ6Zkx+wfWgmNCU9KtKyW5ed+oCB6zhtGM3xonwemq13vgHHoVNjRT82KLOkjHy67yRgtxV0ChsKG0nyI+lu8kbxFM9pxnnhpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6W5bODC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6W5bODC"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so3278144eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792330176; x=1792934976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbcIoitvuAfvu3Q7bq63av2aFlfOV01EbbwSM1UVRBA=;
        b=G6W5bODCnIh3chSl00IK9TmdisgEBNbbKZNxhWZrNjTLCtDdPglbTPPJ7CqUGhZw36
         MPg1vmAzUE5CnjxklMXIzKyGD12KZVVGlb23d5GdSDG9p1iw1MTvBUj8aPA+p8jbPbte
         kDMK7yPcKzOQSWbm8Wfc9Gr8rrA4qnYuDf3xZjNAC0wTKQmpOgiTUOsqBi9YvuqmRTS9
         CD6vVOmJfruJnVcIou95nDGnDRLJJzXlSkKPPlofl1euoKu8KzxlqsQWR+Gxx+Qg+fVg
         7UJvh0BsgjeZZ4CHopoQdZjYZFW66FMt6bYYuPiKqw02/eeQriPsTBP4J1RhhAsqXpNc
         7ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792330176; x=1792934976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbcIoitvuAfvu3Q7bq63av2aFlfOV01EbbwSM1UVRBA=;
        b=EQLknJZEbn7ltqymmA9JYUkAj1cMtWi0WPSkRF9RQC7ZkkYtfe3qiF/pWlindCnZGT
         pS8YISg/8ob7MWLoDXzlQzB9+1dbS5AUt81Bn9YN0n13rJ6G1kuz4sGQJS+VBj/qj9ZH
         FHr+5gMCRXesd+lqBjgLOO0pEOIASAjpPdsgIPSu4hsxn99R+CjfIfZc7m2QYATT/dVO
         B7u1TVDWzgAZ2Uh14tT5g+tzFwq8QM0Dox86z3hDxhhoGa/WEtOz6CJc+lf4R2nxCa0H
         hkZmfwb3lefrFvk7Ca7nEVAPuR7QTuw8KJDmTtW7WZfMl334X2pDmkj1hE1XiDvE00+1
         7uWw==
X-Forwarded-Encrypted: i=1; AKwUvBw7yIUXTfiKxAL1IXGeRh6YII8xM9nksfgg9Deya0xr1K8QuXTlGt64EPkXLOhTMcRUDTszBErlIwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFtojpJEIDBtmlAVm1nEdgDEMhw+5H0QKypjD3F8zIHv7RhLca
	ycMIUN9CitZrqhVu7Bcva3PD6uuCBmnOz91N80t0pOCNEIOHTk1Jk2sOu347ThRs2VU=
X-Gm-Gg: AYBFou2MmfIqQ+MfTYQjwsSnQMaufBqLdIMvIvI6LXDyZA0l4A+q/An+O0qLh0NySWI
	Vm+MqwoBsffsde+U0nUKkBkuG9tlSSzsd0ylIG/Qiqrz2CWtK7+7DKOyOIuFzE5VFPtGR+W9v6c
	9Ala68uywlXU4tN2r/ePa+Xh1cJtMTS+x3FvnEKIMhCHVdo54trKLWJECjQlbOcw9LJFMyxlJaf
	7DERUh4N9c3otXVJ7vw2m8ddAdRyNiiv+SJdhJvPrWSneKVY1jez62pN1n2mFQlV2Ov/7RUs8ch
	unwNvRrLTVqSfir3l8hAK4z8Pyzthb6NRmeBFxSznbBO94mQgKkN9Z0iWzxhdZc713hevdXx5W6
	MpcMAZIcUUN353hdo1ca1/vrqILzY5i9VYSLVG65WKxBt9oID/riwarwXe58f3H9PAnzCa2C9+a
	11Igxu/xyz+I6uSgIBGGVX4AEo46A0NzjDeIE9r1+EvRDNex8KYD1CSdtGNCiSo6853ch6zHIvH
	9fcdgMk
X-Received: by 2002:a05:701b:424b:20b0:185:b157:f271 with SMTP id a92af1059eb24-185b157f2famr6583291c88.23.1792330175524;
        Sun, 18 Oct 2026 06:29:35 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm20099539c88.10.2026.10.18.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:29:34 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: helgaas@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	lukas@wunner.de,
	linux-usb@vger.kernel.org,
	d@rrell.co
Subject: Re: [PATCH] PCI: Extend Apple Thunderbolt power quirk to Alpine Ridge
Date: Sun, 18 Oct 2026 10:29:20 -0300
Message-ID: <20261018132920.7407-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016052503.GT176164@black.igk.intel.com>
References: <20261016052503.GT176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mika,

On Fri, Oct 16, 2026 at 07:25:03AM +0200, Mika Westerberg wrote:
> Unfortunately I can't expose any of the non-public bits without going
> through an extensive paper work.

No problem.  I'll describe bit 26 in the patch only by what I measured:
with it set, SXFP() really powers the controller off and Linux does not
bring it back on resume; with it clear, the controller resumes fine.

> I can comment on the ACPI bits, though. I think they can be put into
> drivers/thunderbolt/acpi.c if they are strictly TB specific.

That makes sense to me.  I'll move both parts into drivers/thunderbolt:
calling SXFP() on suspend, and clearing bit 26 just before it.  I'll
test it the same way as the PCI version, with a USB disk attached
across suspend, and send it as a new patch when it works.

Bjorn, that new patch would replace this one, and nothing would be
left to change in drivers/pci for Alpine Ridge.  So please drop this
version.

Thanks,
Francisco

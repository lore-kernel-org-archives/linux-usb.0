Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C434DEC1D
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672862; cv=pass; b=s3MIoF8tcsPfXyOiGIjYIoBk1lgcPSZKWvQRk+NguGIuy28wDpqonTq3JrES6tu2s+ZfBNbFjjtKV25olwE+clqW7N3dMR9Gir0rLnycy4jHCh8oKvsbjleospeNBCunc/PwFKU5jsc5gkuG1F8Np1oEF8RwNjntWmC2x1SeVEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672862; c=relaxed/simple;
	bh=b9QDa9jgDjFjOwt4VJXvXKJT/NU+qXv7vzZtc7dxTcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jIJTr5arpj1FcU2TyCnred8PAs6sYUY+ipNCp0IohTyUjRNPNyyohd80kMJSFdd++mjCkGpRJtoWLJ9XXr6cJmLj0htH3l957zdoKx4N4UeD+bz5mAaDjg9cLE4fKw/J5h74nmB/IkAwRoLsi1hJOIJ6q/GmohF+/nJZiP19gFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pD7jIUHs; arc=pass smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pD7jIUHs"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so2164741a12.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 12:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672859; cv=none;
        d=google.com; s=arc-20260327;
        b=RPGJ0+mYKzC6tRvCv+wwZJQYQ7ecJn8xicmmLbrQZ858DdHsyB8L2KlGdJR22f27zj
         ZD27KZ5l1h1px1Uv8V+T2BAQlQVdzhl8QhbbvBj4sf942ZoEAIxw/LsrCEq46NgHIPDb
         2/+F5ZSb2B9kM94iQhYoL5QFNA6R1OQa4G9xhKOtf7/5KhZvns/YnuaqyVF/kZjXa94n
         rvEDvSFKvXDIdhntDfDkFW91IY4cmyoR2+mVMUO2ETNySX1EwpfzH2OxkxFj21ddu4MM
         EpPQQdF5MhcXVgKUA7fgf/FI9TpcsgSe0zbvh9uMhkZxuToJCd60ahCplkzZQJyQPn8Q
         FHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        fh=57+0psfdHUW7ANM9hAqxGClHtg+SpcDRPa2Dgi0gOt4=;
        b=QmegjDHZYBYcdop+qsJgi652OmRkRYwqNnAUtPrlf2wsyeauUNjOg+5cFZpgbrFLD2
         m8rDoUMZGiAkyO8g8GIsuxwgMasL7qSVCqJ+vlmynfR6f+9P/E+fM2lE3qjhcPxIgeBV
         Nss+7CPz+xQ5tBILTgd0Tyl3kFJL+XnfdGSxv2zKpYUqmNUAFdmi4IL8xPH4WSWjT6OJ
         kMuyihwZhF82d5TI9Ph+AmWDamMJavpUxSOWFw380hIm8c0FugA5XMpJ4wuvEW5eebCs
         fus6IAYUi6BBUw8F100zssaJgmnqm2Xo19A5pyimP5k/MW42MoIg+9qU5wew+0cFcaT/
         d4HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672859; x=1790277659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=pD7jIUHsle3TBiQoOzuUuhbnc+dlnQP5N2AZvLOedAR4lMChd273hY8o7AUmPzhsol
         uV5bXZS6hAiKHkyg3X+pOTxqUlH5dXzSibYAvDdvIO0xBeG5QNViygc00le4zhHLkM+l
         KCyVOYuca+XdgxtPgRQqVvHynGK0AJxoLVx4Ki2JCnP5eIR9JBSxMbBbJZVSAmbem7RW
         R3Su80xiNWQrDpPBbXoGtm08CAk5kcIrWiSRhSTXhl0Bw9xKVETuV6cVKskBRyr7+FPK
         GNuR9Lax0UecR2pXSkqOPwSf/gDtmQ/227u2U5Ep5FJxMjxHyg9YoVgSadcyUlntB7rx
         wFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672859; x=1790277659;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=rapObf07ZckbP1dZQqcw0mDY4V5iQurNTU3kXXPwXyDk1hGJqu5Br698p6QSGZjfon
         8oCTupMl2EvGiVDhBYM+U6btWIf9ZH4/QigH0uEqt1B+h/tdX1OIka1aLdILcOC5Fxph
         vm/cbdMaItu6WgOyBDoUDW8f0uEtLfr3OQmrHttKIgj4KEww1D/GSCmLdOgfYdnONWNT
         qmXRdg1oVoTbv36Aj3WcmBzDQGOfV8KhZhCqx74U+TybE3jAFJ51UGq3o6svJMeOhH6N
         iZ9dTontps4QTCULsZidy42BDZsa8/p8Cpt2I5gEqWJ/n3egkcqCYY1vLyS8VZyouUpF
         Iqdw==
X-Gm-Message-State: AFuF++kvhYYfQiJ71NikeTAdQDV1ElssIWHZzt7oYJzNYRIK+NWKCu0j
	lluS8SrEVIUfEJmZ5ixqtV5O3I5N+Zf5bnCiTOerk/fWKcp0E5182GC1crP0DcpxBtN1rrAuoa6
	VwQz4oI1tX5HlavLZyNbDhVhrgu6Hpg==
X-Gm-Gg: AYBFou04WDFDY/M+PNAu5u4+hCsqJ7W3knwULeELBgIjx9TsOjQArC+j+VrDWugPEVU
	s5/h4lzGPMIJTf4d284V6Q/B2mgJ4UtIEkT2YadqdK9jVE2FdF2awD0rnu89/C2ntlOF9OBOSf8
	f6WsgCHR2gJA0B36+Q6cj0MP5Kw4Unt04ghRe8y6WxVcL6icalBUgbfzjxrLtH12MRLVMWz54UN
	rtHYEG31zf5ziiG3gUYlpebKRFKn0doXJWY8tkFg39Qz1Jg34cFcDL68Kg4rxU197DvLXIhIJuH
	EFDkHci+2NG1kZxPuYY5vQ2gZDpyb7SReg9FIpPBv2NSCjk1RydEJQ5KN4MsoRLDY09ZzdEGxL1
	VaG8wqv3+rOl0L+U6urLUq/IN66NQrXSjbA4AIfGOA8HqWtvPkxFZMn8deGY74szkW6up
X-Received: by 2002:a05:6402:234e:b0:6a9:bc61:7f80 with SMTP id
 4fb4d7f45d1cf-6aa22418ee6mr5676940a12.27.1789672858973; Thu, 17 Sep 2026
 12:20:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 19:20:58 +0000
X-Gm-Features: AcwNN1WxTWOhjEb7bBl6eypOV0BHfRXqW5W6uIymGwW7YeDpfpFb9TiYbq7J4Ek
Message-ID: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
Subject: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The port status interrupt can schedule port_reset_war_work to handle the
Tegra210 port reset workaround. The remove path does not cancel this
work, so it can run after the PHYs and controller resources have been
released and access freed memory.

Disable and drain port_reset_war_work before tearing down the controller.
Use disable_delayed_work_sync() so that the interrupt handler cannot
queue the work again while the managed IRQ is still registered.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
device mode controller")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,7 @@

 	pm_runtime_get_sync(xudc->dev);

+	disable_delayed_work_sync(&xudc->port_reset_war_work);
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.1

Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81436196E
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083362; cv=none; b=Q22jXvxcfziESkRWiTa4kBOIGX9AxqlJZynlTmEXsLtVF0aUexuVNmAeq3p1GpxyJkSnRXIV7QHX0VjwAQwNRZmyDZNDUvgd0c4v4hWIJoob8pjmRCxXsIARJc83O1ckQbGScIwkRBOlzcXU1UhOuNzuVbwnLUkpxRd1OoKVqF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083362; c=relaxed/simple;
	bh=+HKSqS7cIb57NuFxVyCGGHw3CGX6MedxvTwAXB3aruY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jfQDruTWE3Drq8SK51FElPlcIABcZ56NTVm8pdqx16zKCKv6Q0DThtzk4XFaEAcukYM/GkeYMek1afRA2Md/EI5b2vxCtYqwwEd1TrC2YHQLWPYvu1CA66jO4JbWNtILfQamTftqpy/nY7w3wGVuy0/PYopfE1ifYGESlHCmt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W0l3vLQ5; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W0l3vLQ5"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so524161a12.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789083358; x=1789688158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AU2Dj008QjxxNszWxSoESh/TxmP0j+xMdx3/UcdzlLY=;
        b=W0l3vLQ5wQsNtVd5TMfNRYcBumNMXN11gKIrmvsp9u/Ue8nPllXTSmdN3dQyzq5m0n
         ka+frwH/2z8YKPFh8tlOrFWaAFkAB73FQVIXu/tl9LyrwQpKiPrMxzKX3fw78wQQQv1K
         xnPB1QRAtbb9ynEfmMFSNoPttfJauRhrsxf9YEaE8qmPg9JVrqKQvx/7KJf6nnVmOe+W
         7fjkseG4c+7BEMiD8kOAqV7zzGX8j5nddebChth/C0YLOvHFfukMsFecvJuB5uQUCj7O
         zqDiot67ICFhpV16ubPeqlneerRZoGbldbo4/BMh3zAUQmJ7DUODx4HDYQsEAop7yCTM
         wzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083358; x=1789688158;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU2Dj008QjxxNszWxSoESh/TxmP0j+xMdx3/UcdzlLY=;
        b=QeKYFLCdmKetYSkFxxU4/fiqflzMDyCkGid622uzSjCDgZPhhBcbszaqdTiRQeTN2a
         ZwxkKmLXtcXyfy7E+WuO9qFtgTRybnG9AHc+qFIopEyTQyHrDalzDT1bCgqfe039f0kV
         eIMJoO54WGYixtmneShRHratd/JMKIrWMe9cZnQn1uhAZ27bRfN2tVB4ff+91x5YuqOg
         JP/rNeZhZAcl19Tl87EiHuJ3dDW0XUudfUb/JoUZyjPc9LO1GdH08O4NZv1nTvM56WiY
         aEpESRGaDj/nPEPZqmN4/AmOnl//efGJvVD807GKPIBm0mZJXuR+kQAZ1qxNqbONNMsT
         6R5w==
X-Forwarded-Encrypted: i=1; AKwUvBxxt/DVyLxnN7ypT/crc+Pf8D3WzBNy0aJwh0wMsiUY58HfONTf5l8NzLG9r3wih3AisvJGVxp4BEo=@vger.kernel.org
X-Gm-Message-State: AFuF++nMyRvl+YvztqNJVUkZzwQe++7UoCRRp8gKVpGe8lH6FLMEK6hX
	MVidakc4rhE8XP8ib6w2rlFL/ahadocC3WUUTzi/vzsZUpdA5n5Lb5jdRr8+48pEukrVnK1pBj8
	TOvlEGg==
X-Received: from dydc26.prod.google.com ([2002:a05:7300:311a:b0:315:bf25:ce14])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a0a:b0:3c3:a3f4:5485
 with SMTP id adf61e73a8af0-3daed0feedamr2308211637.6.1789083358392; Thu, 10
 Sep 2026 16:35:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910233553.3477055-1-jthies@google.com>
Subject: [PATCH v1 0/2] Cleanup UCSI DisplayPort OOB fix
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Recently I sent 
https://patch.msgid.link/20260825234545.2076049-1-jthies@google.com 
to prevent an OOB array index in the UCSI displayport driver. This
merged to 7.3-rc2 but did not include feedback from reviewers in a
v2 version of the patch here
https://lore.kernel.org/all/20260904234401.2339633-1-jthies@google.com/

This series reverts the v1 version of the patch merged to 7.3-rc2
then applies the fix including reviewer feedback. Because this
series is cleaning up the previous change, and not needed to prevent
the OOB access, I've removed the CC stable and Fixes tag from the
displayport driver update.

Let mw know if you have any questions/concerns.

Jameson Thies (2):
  Revert "usb: typec: ucsi: displayport: Fix OOB altmode array index"
  usb: typec: ucsi: displayport: Check CAM to fix OOB altmode array
    index

 drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


base-commit: 34c9c5517033a74039a54dfab24e7bf767a4e0e4
-- 
2.55.0.1007.g17ff1f9808-goog


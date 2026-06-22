Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECC392836
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121157; cv=none; b=tV/yWv6ymnV+CkxxF/AQJDpOVcH2kUHtILhWrMKVxd4E9pGjMhNtuaPRh8iw4w5V6+5HPK0Z5fm1I7iIoacNYFKelc5sSIMVVQYC6OS4w2mOxxXXeD/8vKqaMSBsybHI/YotKkSVhN3pShVL51iL0y3b4QXY8A53SuE/zEFz1SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121157; c=relaxed/simple;
	bh=eu+GJeFnTcnrRH/YTV+AB/tyehPblnosPlo9b7R03oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l1IVoe0w42YvpmlN/AyGB01E22m9c4Mj/wJGDj833XpbHpVJw9j9Hw6erWt9pGC1Jd6FumMvPSWygjRc6fak2Z22tUUGiBy8kSYbC8NVamYzahCsKb50LVh/yLQz2ASkIt2boPGCDYgvzcWwz+DaM8HLQVZWgt5Q3Gc9kFoMMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mj1U1VGq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mj1U1VGq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so6608997a12.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782121155; x=1782725955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCi9OiSqIs4619EHraKpkIBeaT7EInxvbeZ757OwJfI=;
        b=mj1U1VGqYk0oLwv27cwFRH8edetc334NTF9Daey4D8lgyCNA3NzyYRjXfqLORcKKlp
         pRmdhogHoHgtidwhOB0SupqfuUR9VWz4ZX6EpERwc8sHTMNr4OIwH86v9GOqbohamiq9
         uO3hOljDty4e8OURiO+k7JFy8/SkeDCxMxK88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121155; x=1782725955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCi9OiSqIs4619EHraKpkIBeaT7EInxvbeZ757OwJfI=;
        b=c0DbjGvkyNY4dqNUV7mXV9yXG12UvJAFBNv8PyBs5S2O4K1DOnAonnhAFk8pv9Sjnv
         4f+evXgG6zyqQlaPsAbN3cf9cn/cm0g0RR2atuABeOwZtKblkV4HeGhMuLpf7cmJzOt0
         tOUSK3yXa5W4q8ZP6TGJwjuFpi2XgnkGKyFePtUXw6CZ/2Tw5G31xYrJP1O+7bxXymym
         vnTn5nOEGvWmDIIMjlhp/iswkA2PHiRobOfzVR33ELzI0NT888+RUtMI/ERb01P9EmdQ
         QFKnBouUYjdkEc32eIWIrPMVmvS4aqGp8Ce3tHmcrqfYxR4J449XxlHqmNlkZa4o6mxA
         MMlg==
X-Forwarded-Encrypted: i=1; AFNElJ/69W45Mtms0ENTwRtOD/DucZHKYDN6n2XEFZsCsExQUJwxizGwHWvpdUOmWvHzR1DFzVnXIkCQMkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8l43/Rf9As0NWaFWM2aOsdmV4Nx/R0l3KF/utmc53r6mImjL1
	lLapM0R6kvPIqd/mdTcF0CJNWvNZdHxI0HzKFtW3ePcc0LeCLFGSxyPgItcP2X9UZ+HKt3mXqA/
	o9qA=
X-Gm-Gg: AfdE7cmih9JbBb2vXeLGzZURQvYTSD8p2kpQBnmQ5cOKmhyzyx0e/HX7rqLjeUQBrpv
	x/2jZaukKeV/I76wQ/Fqm8bJ5YaVdh+JsuRNuBv3BJCrXomk0iIqA6Qh4iu5T9PMiZEB0bON1XH
	eaOxPI/lBOvXK/kuQ9C4aPshxBSISjeoqNybAm2geIwypgpqcS2PMVJ1GD0QDBpNBVI2Jqw63Fi
	9yuWWhrr0eErjU9ZzPC0D+wnnoYzirCFE5Y00ZLlTnI5awO96IqCeWw305FklAT0oz1JCFUntI8
	76I28gUByJIavGGoBYfX5tS9QHCWnFqnF6Ke6hYwW0vsMHbB18qZ3RvwCsc4C6B3dMa9ycTqWFf
	tym6UQ/eAXF/21EYnpnrI5qdAxFyJ6QqbFGFFE6Ljea2Wtz46nkI5J2anTv6k+wMLJDaLbz+MbH
	hiX9811xK5dSHT/wzAZuKrz42JqpxIjChQoSeV6fgySrebciOznwe/CjlAydCulMU9XckasnO2B
	M/MazuZMQ==
X-Received: by 2002:a17:907:e84a:b0:be2:208a:a8ae with SMTP id a640c23a62f3a-c0b60602f38mr633263366b.22.1782121154828;
        Mon, 22 Jun 2026 02:39:14 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e526asm324855566b.51.2026.06.22.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:39:14 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/3] Restrict alternate modes based on cable capabilities
Date: Mon, 22 Jun 2026 09:39:07 +0000
Message-ID: <20260622093910.1210089-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, alternate mode drivers (like DisplayPort and Thunderbolt)
automatically assign operational callbacks (`typec_altmode_set_ops`)
during probing, even if the underlying cable capabilities cannot support
them. This can lead to incorrectly advertised state configurations or
initialization failures later on.

The first patch introduces the core helper function, and the subsequent
patches update the DisplayPort and Thunderbolt altmode drivers to
utilize this check during their respective probe phases.

Changes in v2:
- Updated patch 1/3 to use a switch-case statement, added detailed inline
  comments, and separated the non-e-marked cable validation logic.
- Patches 2 and 3 remain unchanged from the previous version.

Andrei Kuchynski (3):
  usb: typec: Add helper to check cable altmode support
  usb: typec: thunderbolt: Check cable altmode support
  usb: typec: displayport: Check cable altmode support

 drivers/usb/typec/altmodes/displayport.c |  5 +-
 drivers/usb/typec/altmodes/thunderbolt.c |  4 ++
 drivers/usb/typec/class.c                | 65 ++++++++++++++++++++++++
 include/linux/usb/typec.h                |  1 +
 4 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


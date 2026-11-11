Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400755;
	b=osY/0/BGcF6u7a7ddm5rVfY7lGneu9dbi91VHku8NhXvZb824yYbnvXskEZbYS8C8Pyn
	 oY81/mg3Iqdfjt6DEhay8A28H4IqETu/URvr4jksaE10IqFYoais0JjiegCec32Qz9E0q
	 H9OP90ADloxpFVRVp0NaPPRH5W/VEP4bFfiqXTckzdzwfSLhdF7L5lutyy2FdF4wHwX1F
	 Wnftx5cRFo0VxU5yCOr8ttHuJQp5+hIXTRJbDWTrRX6MpnPIMvsa/h11aMBm2oQ3E/7GA
	 eL9+S0z8gawq9wDw/0ttyQ2i383j+vHRjti8W0uNoGhjYMz5htJdWTMtCggVsNmxpiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PKvhmV/0vdTQ4DXdhk8/v+baiIsK6Gyi6w4SVC1Tj1M=;
	b=QoVcnbwSFLVRVuLAc5y7Lm2b4QiRhgWDeSKjgYCYxKg+GS5mbvfX5IPYO4FrqD/NlGb+
	 npsQHVQbr1Um1Qh7/vzSQg7I8CTRwmLQNsGAB3KOuXkjZ4wt+q8HK8Lb532UD6GrqObA5
	 8vfQYukuQVAOTCQcWjT6W7tJq2ko4g2TZwXT9cJXkqqTG90DDRhIU8ntFkn92qwoye96p
	 syZeGQQqi8+VWCcqMZLbd1UWqocRqasUfFaicFx5wgalk54L5Z4gP1gFXz4MqEKFWS2ie
	 nhdqzh4BF1mEWoczfgTJkhZNF6V+NAcgW/6xI2VXbKc/tO5XH4f6hm+8QiPGdy/mbvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dgA5d4zJ;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A9606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dgA5d4zJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400755; x=1825936755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ewtLS5Rw27+KAoJfkiUWSaiTgAn/F7cek1QyjVD8X+Y=;
  b=dgA5d4zJYzjW1U4OgRamwcmafSAFblqWXdFbK+sUzzPPJ5FC28l2kOrr
   pqEWtTFUc6dWnHYmrZf3X7m89xM5cOHe+3MKyAaEkSVObU3xJjsLxgNEM
   qrNxMCGoIndnMnbrC/4BPTD1ngboQafyww5xD7CalH+PhXj3Nioe+A7mJ
   7jl1EvZZnOUX719MNpfx+sTxzieP0CBTprTAAXkUFXDmufsJCReIepKSp
   48o845WZA5a28S91ZvqnALviqrhDCdCmSErgPgfK05z8pX37XfsqEavpD
   OROdPcXIKf5EWnmN4q+p/z0hnlzU8gd/fWo8SYXbf9hrlaP46DdTYhzhL
   w==;
X-CSE-ConnectionGUID: Vw4q9b3NSPOVya7+MfHfQw==
X-CSE-MsgGUID: fWAVnCI5Qw6Vm8M19rH6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3080761"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3080761"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:39:14 -0800
X-CSE-ConnectionGUID: 0gAxkusuSbKSctQfbjLwrw==
X-CSE-MsgGUID: tl+PHfPZRZ+Ym4zB5KBhvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8507631"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2026 04:39:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CBDBC9B; Wed, 11 Nov 2026 13:39:10 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] mailmap: update Mika Westerberg's email address
Date: Wed, 11 Nov 2026 13:39:09 +0100
Message-ID: <20261111123910.1324579-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Westerberg <westeri@kernel.org>

My @linux.intel.com address will be going away soon so switch to use my
@kernel.org address.

Signed-off-by: Mika Westerberg <westeri@kernel.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..8eee328646b8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -668,6 +668,7 @@ Michel Lespinasse <michel@lespinasse.org> <walken@google.com>
 Michel Lespinasse <michel@lespinasse.org> <walken@zoy.org>
 Mickaël Salaün <mic@digikod.net> <mic@linux.microsoft.com>
 Miguel Ojeda <ojeda@kernel.org> <miguel.ojeda.sandonis@gmail.com>
+Mika Westerberg <westeri@kernel.org> <mika.westerberg@linux.intel.com>
 Mike Leach <mike.leach@arm.com> <mike.leach@linaro.org>
 Mike Rapoport <rppt@kernel.org> <mike@compulab.co.il>
 Mike Rapoport <rppt@kernel.org> <mike.rapoport@gmail.com>
-- 
2.50.1


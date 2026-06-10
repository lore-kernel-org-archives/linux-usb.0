Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB4238D52;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097766; cv=none; b=piXHC+tT0u/JQyU+dfWySiuBzyx/x1ZKwtVvsODtt1kGRhKcSeaoLMDkKIuXZZSQ19Nas5cnIRPLm1X0RhrQTaMBZ8mEuqMgQ5qhu3etQTKGkv56wxgZY90P2fkvMNUT9wyA7GvuAevK0QuXOkiz3rM2F0jRc36Z7vGVaXMhTRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097766; c=relaxed/simple;
	bh=jvlDuMmUjYevqfc5BYIayAwyqqCorS5VGrgJv9Xngo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXGktQyC6cnTdThDGx+rBD8ZLMDQiaL4GReuMMqvmm4e++N36Tn+VrT6ij/RtEc5SXJPg4fkJH+lXzjd1lwoAIHeQeCs/uPL1niwzGoiEYp3NkSq50q+v0YpWz80/3gKBwmnlh1PPkwM/BhEQz/XL3a5uZjRP5DM6UO4ZYfuMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjHShmy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjHShmy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC631F0089A;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=OtIMrPOOKHMKCSD6WyYuC5h/dpifqUqzh43KdRQiPc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bjHShmy0cZj8yvc5zyPu80TRHL0/KUzMnmRl2/Kn4SisHLUmMJ4UHa7Eg93dDFYPV
	 ItyT6hWG9dbjyBxezKr9LeQdpAOhRM6r/skqSimXYzPdPJZB/gofDls9mJGo2bCtc8
	 bRZ/zqrmoqn0ZrCGjuZ+N1LFLUL2fqiaHDQuOQ7WwwkAasuTIRpwOGxSTM1ECDWon7
	 TLu/WfTfl+broHj2g6Yw+n/aRzLbJTiCbI2LeVTAtSPeqh3WoQzhtZBAWD4nQCmca3
	 tFCDCkKSl+DhaSfT9mCclciY80mIqV3GSxI3p1GRLUyc9O7DfbxYDWtn+wiWBvBM4w
	 L3/bnW+CVhauw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001UfD-1kZc;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] USB: serial: digi_acceleport: drop unused in-buf define
Date: Wed, 10 Jun 2026 15:22:29 +0200
Message-ID: <20260610132232.356139-9-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610132232.356139-1-johan@kernel.org>
References: <20260610132232.356139-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the in-buf size define which has not been used since the port
buffers were removed by commit 5fea2a4dabdf ("USB: digi_acceleport
further buffer clean up").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index efa853a57bb2..6db07fa56a17 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -32,10 +32,6 @@
 /* so we can be sure to send the full buffer in one urb */
 #define DIGI_OUT_BUF_SIZE		8
 
-/* port input buffer length -- must be >= transfer buffer length - 3 */
-/* so we can be sure to hold at least one full buffer from one urb */
-#define DIGI_IN_BUF_SIZE		64
-
 /* retry timeout while sleeping */
 #define DIGI_RETRY_TIMEOUT		(HZ/10)
 
-- 
2.53.0


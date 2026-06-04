Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE19847DFB5;
	Thu,  4 Jun 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584033; cv=none; b=BCk69n/qFFFgXkn1UHCh4G7CmPxkgg2/r9iJ1cjAGTbNoEBEKgWEGBkl7lw8OjEH3gXEH11bkay6jW/yJYD2Fx2SHHSMhl+iZJT4sJ4B/rJLQpuQHT3VoqtsyoKVA3z8a1+N7FcQlsg6/2N7qd1aUKtLB/y425xE/FSmy2k9TPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584033; c=relaxed/simple;
	bh=ey8LRX7LSP5XkMuVA8RPX9qSyRN/7vbToHakip23V20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhzemQR7m2ZaqKHiMsn05IoHpPk0KeiRK5S15CMd5tzg81wwwIHRw4umGVePQnw/jZmKs07RSkyxF/4lYMcrFeCTuyNIlNFTmYlzRmJlrf3sqGcaRUcpHmZhlTy9LKeKqT8RlKYvkqFcCmW9vFHvZY503XNCCODkp4ejMTH1Y3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ObnJ9Muj; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ObnJ9Muj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I2QzZQQOM0K7IgNR44UQT+aldLZiHL+dLOoIFgqr9h0=; b=ObnJ9MujmjUuLYvG6HQkuh4dOA
	iY5Jmv7zU3WsjJMKbiEBI0H+bhjqzL5UFnxsDvQ93/dGw85ujGaGRGHg/Mi75KRnfnx2WABU2PDOp
	7Cc0yH38gTiiWFQ6kZKDk4UUOKZtQVXEr140WJxw9WcPDSRlovYJOgI9bNvemnLbM9Iy6SjEkwm1Z
	pPDAEpphbbb/939zXK/6T/z5WYKXr/7a7vSz9bbEvYanh/CPVpMFI7NGwUAUIzRRWD0ReHl46sBjO
	0K/gJ3Cr5iFp5HwHOyC6d2BxwuLPGFjkvlZP8pliJY3ApAGAfLDWx6zLbDez5qBacSbdlj8QEyzGW
	bPGwMpfA==;
Received: from [49.36.124.180] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wV9F1-00Cfsr-OE; Thu, 04 Jun 2026 16:40:16 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [RFC PATCH v1 0/3] usb: early: xhci-dbc: Handle out-of-bound
Date: Thu,  4 Jun 2026 20:11:19 +0530
Message-ID: <20260604144122.962236-1-uajain@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small series to handle xhci-xdbc caps if the offset and out-of-bounds
for fixed time boot mappings. Previous discussion is at [1].

However, RFC because it doesn't completely work for me. Patch 3/3
WIP, makes it partially work (xdbc being recognized at host side)
but still something is OFF. 3/3 might contain a clue which we can
probably discuss in reviews.

[1]: https://lore.kernel.org/linux-usb/ab199e7a-c0d4-4150-bbcc-9ab8b18f0725@linux.intel.com/

Umang Jain (3):
  usb: early: xhci-dbc: Track early_ioremap size separately
  early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
  WIP: early: xhci-xdbc: Map lower and with 0 offset to partially work

 drivers/usb/early/xhci-dbc.c | 77 ++++++++++++++++++++++++++++--------
 drivers/usb/early/xhci-dbc.h |  1 +
 2 files changed, 61 insertions(+), 17 deletions(-)

-- 
2.53.0


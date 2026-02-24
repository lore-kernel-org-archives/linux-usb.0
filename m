Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06906341041;
	Tue, 24 Feb 2026 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970119; cv=none; b=OD9U7ILVQnD5lmch9GkIC6EGWaVQq4jeV5whIl58L8SOlur8o0tZeOv95A/6L7DTyPJp+Q2tk1gzP8pS6qdqxIeqLcew/DLmHIuQsnu++g1cMQHEUIPRECr7HzUKJvDJS5k5qH/nVcMG5o35Cu+JnVZ2PNPaXM3Shi2wI6GXzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970119; c=relaxed/simple;
	bh=7Hf7qhSgheZ1cYXKewudhyuLhyRCrjovlcamlqIB0w4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fudIZmbH+NaLSpBP8Y3W44/Y4FvQYjyQY3Iye72NUqBBT035AAMcM/pAZGtlFz4LNHb6cLesl7n4uy5p+TSnFlh7s0F8h4yzagvYQukOzvQc5qkIzvNOd6A1CTXW9aXe64r126q1dDBn57BiPHTzXkSsEHqN7UXQeTsBDklbGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 209852337A;
	Wed, 25 Feb 2026 00:55:08 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH v2 0/2] USB: sisusbvga: Fix integer overflow and NULL dereference
Date: Wed, 25 Feb 2026 00:55:05 +0300
Message-Id: <20260224215507.1736020-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in the sisusbvga driver found by static
analysis and confirmed through testing with USB gadget emulation:

1. Integer overflow in boundary check of sisusb_clear_vram() that can be
   triggered by a compromised USB device reporting inflated VRAM size.

2. NULL pointer dereference in sisusb_read_mem_bulk() when both
   kernbuffer and userbuffer are NULL, causing immediate kernel panic.

Both issues are reproducible with the 'USB Gadget Tests' framework [1].

v2:
- Patch 2/2: Move NULL check into sisusb_read_mem_bulk() and
return -EINVAL (suggested by Fedor Pchelkin)

[1] https://github.com/kovalev0/usb-gadget-tests

Vasiliy Kovalev (2):
  USB: sisusbvga: Fix integer overflow in sisusb_clear_vram
  USB: sisusbvga: Fix NULL pointer dereference in sisusb_read_mem_bulk

 drivers/usb/misc/sisusbvga/sisusbvga.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.50.1


Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309D2D738E;
	Wed, 18 Feb 2026 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771376706; cv=none; b=Wx2nkT27X46d2+HNEE0nmLZCW+uyj3l85JeOYOhprZz/awm863q7myW+v4Qfe5emf8roDaY8nJpXYbKbCrpVDhk+ug0ZU98MiCYvL6q+Q/GkZradT1yo4ggl0uW3y5ieqFipfHf+UlJ4blBjuurVdMMfu7kpS/ZsKrY+IwOlg7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771376706; c=relaxed/simple;
	bh=wehEoYOr8OC8GgIZVE4dFTfDzEEbVLcgDjCBOgF9oMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SgG8JzjfcIMZzdV5nyHxE1KjYT5+sYZwrthxPPcmy3ZZoj/zci/9LTVDLxoerC6cHp2SJLL0515Bpg0TuAhlos6qcDFs/UE0lbi0mSwtZbeKGrdEVe3O766qLdwztdP7YCAUneDUoDQ3GnYmXBOE1aRPUl0hWNMDfxuZIApxdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 4AE5923375;
	Wed, 18 Feb 2026 03:55:24 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH 0/2] USB: sisusbvga: Fix integer overflow and NULL dereference
Date: Wed, 18 Feb 2026 03:55:21 +0300
Message-Id: <20260218005523.1259725-1-kovalev@altlinux.org>
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

2. NULL pointer dereference in sisusb_read() when userspace passes a NULL
   buffer to read(), causing immediate kernel panic.

Both issues are reproducible with the 'USB Gadget Tests' framework [1].

[1] https://github.com/kovalev0/usb-gadget-tests

Vasiliy Kovalev (2):
  USB: sisusbvga: Fix integer overflow in sisusb_clear_vram
  USB: sisusbvga: Fix NULL pointer dereference in sisusb_read

 drivers/usb/misc/sisusbvga/sisusbvga.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.50.1


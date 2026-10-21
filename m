Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595289;
	b=g/pAj/btFwx/FxUQgrnkVCPdWAGFZAgSbxhFBNukBIgJDvHQKYoT3TxT4zHZU7tIn67U
	 ynpQIXU9eu0SBEIquh6ifwcd04AfBA6B+w//1ajNUi0CihZdsu0wgjjLIfPmHfPHQa8Pq
	 /dQoWX82A1VwIItYoJW7tQaDRjh4wBpvztSUDmW0AhAQREkMX4ql3Y73spXooUS4YxJPr
	 sOzcZ1vrfq+34dQkOReQObf29NZmnh+4w65Lq/474+jNsGFur6AhjESVcNqIXWalUxoK7
	 /6cpX3o8sFJOhbC5k89BcS3FXeBH3qBpwD483zqLrgQO5wZEYinBozt14zfmvhWvRmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
	b=otrV/tQBvCsa8mCFcOwk2EP16YS2ZGgrzXcaB4yxDNewxfPlmf1/8HqJ0PLCXiaOLIbZ
	 AFejND/g24O+9+GOq9kvKcYLUjZxuD7tyErZGtbzPNW8kZ26tLR3TtJOGjF6QYa1EEYvd
	 t9CN+jDY2XY4L9bEaZBaTr5blE4vrFeik4M6Ff7js7TFMi4f24xBzlJz0nA0yF0+bZU2z
	 gqJm8YuwIbRikyNv9zsKjlRDf+ONrPUic6bvRrC9yNFJCRh5wiDQ7koGXMJ6/K8/qBdsR
	 V5h1ffeyjYwwsiAzbrMiAos22Lkj2CLOnVKatPfIOV0Wsu3YhRc1sqiiTukG1jXLk5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nZdPsMwY;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC418606A31F
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC418606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nZdPsMwY
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4d7034a99a9so485765b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595288; x=1793200088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
        b=nZdPsMwYAC0lDw+E+CCxWUq+R8F+hRu+j9rpKUHSrA1H/LgV+UV5lyUdwCZ10kfl5/
         EG+1/ClCIWRNCcBVzjniqo18h+Eq60wHV1fPnBZdRXCzN6y2rvBzAMBis310HRART4NY
         UZieC6ImFdXfnCiCuhtIUk9d9pJqjTEpHPkXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595288; x=1793200088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
        b=KoEdcVDCDzYZGPTiI19dUqOefqc33v+hjbbJzUxsaXbqCrOAB50Wa9sQ7O1oZBElZ/
         GB8JroFLG24Y0X834tlbWb8PMTqbl4Z88lKf6gKGLpljlB3ndtsq5NGL/ZgNJ27hy0hC
         3FX8NhMzBzwdZVUQh4YujdqSYY49v0lXDde0LQyng9McOs+zs6gR2KIWXG7MUdN4Ei3X
         U/5X9+4PbQ3DKnQgiK4ts/bkMT9Nq6nIGZFYEKLVcN6U7yvqEFg9GcS06s4MjUuv8Rcx
         f0D0Rpf+ixPaUG6Jh4rDwcnHqjmseWFChndQyOFR7SmUzvv86wueUdjECaIzbCpLYXA9
         NGKw==
X-Forwarded-Encrypted: i=1; AKwUvBwbmxSkMjI8KFNh8JRSqPke2AoXUgD3GUFlML4rRFkSWQC4GuenFo+ikObsLr2kgX1iAm8f9xIX+Xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxCvYlI+BzRocWWS4Pqgka8Q0oGgdoSMUd5wIinnETk1cMsSMX
	cEiVlU2awQYUqRAl5FaL8U1UrAJQfeCZ3aDgba6I1yHN+h/OqlbQ0RF/qEMssLikFaLvsq39Z+r
	diKSEnA==
X-Gm-Gg: AYBFou0n4B/AEHUURivWo3I3PB2XqVOJl3BiJtjLkBkhoPPxHitQf6PY+JyXqbG8jTr
	3gTVqxyFJCjp7Mmzo8codhu2YMxgVV/y5BRZ2jtRWbx1Xc4ExhxNTKW5KfOiwprvuEtGAEiREJm
	La1kw4nSfBNtpzb/9+sJnFokBOhIrkFlcRm4Nkx7j8ky4GgaaMhPzu5rZ6glYGdtHorjrV+grYx
	/aWCpKlyoykYN4jEXjB5NeGbK0cfJHCeoaDHjtqXPN2rheOgHPX8eSc5x66zCEyVglaDeBqMI8q
	v+ThrnGf9oLntKE+ZUMpoYdULk1RtLwKwjFZCrh7XmCVu2naUfE0jn31XRNFO5F4hiqQRzDDqq0
	lClB5Z1ZjdX4Dx+OsMTTfvUJD9JVPECK4yT88PAiS0E/NV4ViKXNbBYmL5cFCRXMA7YYwBGa20v
	p/KCJQZOBusgqUzobvYWCbwyjD/uSKrYarasUN0idChy5h/vuQ/5MHb6EUGWpHsuuuki5NIcHoc
	S4zVgamLUoD0uqNFZyA9sGGu0g3WxvyyerSir+OyJH3ClidwlFWvWf8Y+DOkveR9MUA1jkMErJg
	Vq+jfMPGejMLz68vmbuM4c25GdFofJbWYRFRx0xK0nekpw==
X-Received: by 2002:a05:6808:181f:b0:53a:6769:c35b with SMTP id 5614622812f47-553597021ebmr1486139b6e.12.1792595287778;
        Wed, 21 Oct 2026 08:08:07 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:06 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	Anirudh Rayabharam <mail@anirudhrb.com>,
	"Brian G. Merrell" <bgmerrell@novell.com>,
	Suwan Kim <suwan.kim027@gmail.com>
Subject: [PATCH 0/6] usbip: vhci_hcd: fix URB giveback leaks and disconnect races
Date: Wed, 21 Oct 2026 09:06:55 -0600
Message-ID: <20261021150704.3129446-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a set of URB lifecycle, locking, and disconnect
teardown bugs in drivers/usb/usbip/vhci_hcd that can orphan pending URBs
and wedge usb_kill_urb() and usb_hub_wq in uninterruptible D state when
a virtual USB port disconnects under concurrent transfer/unlink load.

Patch breakdown:
  1. Protect urb->hcpriv accesses in vhci_urb_dequeue() with
     vdev->priv_lock inside vhci->lock (matching vhci_urb_enqueue() and
     the cleanup helpers), and add a !portnum || portnum > VHCI_HC_PORTS
     bounds guard to both vhci_urb_enqueue() and vhci_urb_dequeue().
  2. Track whether an URB has been moved from vdev->priv_tx to
     vdev->priv_rx via priv->submitted under vdev->priv_lock, and
     complete unsent (!priv->submitted) URBs locally in
     vhci_urb_dequeue() instead of queuing a CMD_UNLINK PDU. This
     prevents vhci_device_unlink_cleanup() from freeing the unlink entry
     and orphaning an unsent URB on priv_tx, and prevents CMD_UNLINK
     from being transmitted before CMD_SUBMIT on an active connection.
  3. Clear vdev->ud.tcp_socket under vhci->lock and vdev->ud.lock in
     vhci_shutdown_connection(), reject vhci_urb_enqueue() once
     USBIP_EH_SHUTDOWN is set or tcp_socket is NULL, and drain all
     remaining URBs on vdev->priv_tx and vdev->priv_rx in
     vhci_device_unlink_cleanup().
  4. Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
     pickup_urb_and_free_priv() and also clear URB_DMA_MAP_SG in
     vhci_urb_dequeue() and vhci_cleanup_priv_list() so USB core does
     not call dma_unmap_sg() on unmapped scatterlists on any giveback
     path.
  5. Allocate struct vhci_priv with mem_flags before acquiring spinlocks
     in vhci_urb_enqueue(), and return 0 (with VDEV_EVENT_ERROR_MALLOC
     triggered) if struct vhci_unlink allocation fails in
     vhci_urb_dequeue() after usb_hcd_check_unlink_urb() has already
     marked urb->unlinked.
  6. Serialize vdev->udev clearing in vhci_device_reset() under
     vhci->lock and ud->lock (dropping old usb_device and socket
     references outside the spinlocks in both vhci_device_reset() and
     vhci_urb_enqueue()), and reject URBs from a stale usb_device
     (including address-0 requests from an already-registered
     usb_device undergoing USBDEVFS_RESET) if the same rhport is
     re-attached before usb_hub_wq finishes disconnecting the old
     device.

Testing:
  - Built at every commit in the series with W=1 (0 warnings, 0 errors).
  - Verified under User-Mode Linux (ARCH=um, UP with CONFIG_PREEMPT=y,
    CONFIG_PROVE_LOCKING=y, CONFIG_KASAN=y, CONFIG_DEBUG_ATOMIC_SLEEP=y,
    CONFIG_USBIP_VHCI_HCD=y, CONFIG_USBIP_DEBUG=y):
    * Test 1: Abrupt server disconnect mid-transfer while client threads
      loop 32 KiB scatter-gather (num_sgs=2, URB_DMA_MAP_SG) SUBMITURB,
      DISCARDURB, USBDEVFS_CONTROL, and USBDEVFS_RESET (5/5 cycles,
      0 D-state tasks).
    * Test 2: 500 rapid SUBMITURB + DISCARDURB + REAPURB iterations on a
      live connection, plus deterministic verification with a stalled
      tx socket that unlinking 40 unsent URBs on priv_tx completes them
      locally with 0 CMD_UNLINK PDUs sent on the wire.
    * Test 3: Immediate detach + re-attach on the same rhport while a
      client thread submits URBs on the old usbfs fd, confirming all
      stale submits fail with -ENODEV and 0 stale CMD_SUBMIT packets
      reach the new server.
    * Test 3B: Deterministic reproduction of the field deadlock sequence
      (unsent URB queued on priv_tx while tcp_socket != NULL, followed
      by concurrent USBDEVFS_RESET and server socket close), completing
      with 0 D-state tasks.
    * Test 4: Lockdep (debug_locks = 1) and KASAN clean across all runs.
  - Built and soaked for 18.5+ hours (280 cycles) on an SMP gLinux host
    (7.1.6-1rodete1-amd64) where the original usb_disconnect() /
    usb_kill_urb() deadlock was captured, completing 125,000+ EP0
    control transfers, 21,000+ async URB unlinks, 8+ GiB of
    scatter-gather USB Mass Storage bulk reads, 1,000+ mid-transfer
    SIGKILL client aborts, and 850+ live USB/IP socket disconnect
    teardowns and port re-attachments under active load with 0 kernel
    warnings and 0 hung tasks.


Raul E Rangel (6):
  usbip: vhci_hcd: protect urb->hcpriv with priv_lock in
    vhci_urb_dequeue()
  usbip: vhci_hcd: complete unsent URBs locally in vhci_urb_dequeue()
  usbip: vhci_hcd: stop enqueue and drain all pending URBs on disconnect
  usbip: vhci_hcd: clear URB_DMA_MAP_SG on all giveback paths
  usbip: vhci_hcd: allocate vhci_priv outside lock and handle ENOMEM
  usbip: vhci_hcd: reject URBs from stale usb_device after port
    re-attach

 drivers/usb/usbip/vhci.h     |   1 +
 drivers/usb/usbip/vhci_hcd.c | 236 +++++++++++++++++++++++------------
 drivers/usb/usbip/vhci_rx.c  |   6 +-
 drivers/usb/usbip/vhci_tx.c  |   1 +
 4 files changed, 162 insertions(+), 82 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog


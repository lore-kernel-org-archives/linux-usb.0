Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB514FD27E
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093249; cv=none; b=HcAWc5PSwHf2e0r9P2LWTI9iuz6iaKWDNEdj+UvjD7nSJHhYrXl7HEKRUFxMtUZgKw9FTHrwTEnCt/Oibjt4mun7Ioi4jyuERGZemjqG9+xczsVBQiqg+uq4VW7NsTvoC1reIyU6fiJnX8Kp4JxXFbyRTvCDerrJcnKyXKQWa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093249; c=relaxed/simple;
	bh=exYz8HojfNFpfT1r/TAXOuBExCBpvaaa/xfi09cNlzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDh7melzE28GGx2c2+Y+vBGXidfNPdZ+VWnfTc5v0s+QT73hLvhw2DzNLCh2DIm+YgXRMeISewwlOChCGs82sjF9SvhSX2V1oY8K1uATSTIcOnv3aIDnnK21jRKo4i/IPh4rRRGpHbfQeC9PRRGHQZfFk+AtfYanB6WPaVBjr80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qacgLhXK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qacgLhXK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c02782159so3506808f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093245; x=1792698045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=qacgLhXKOC+sSCreea5CASCXLhJqmqczd4HPBRBVZ58M1/N5wAU1qkMTLA0u4TAscx
         Xl3vo7HyLmtX7XpTuAJvyxcTgUjob6OPH8OqerEq4bq7Za4y+aaWb7ge0JpvcVLGH3Ez
         SMok+dIm8wBV5woC55bUWD8gUyOUrC1JDdO8GTJwmnD2ssrWwVwPnouKMef9SWuvAdz0
         rXgibQly6FrJ1e9Kqt1kPJcTY2jw0kBfOe5ZTkddnAXneMfMx3tgW7A83l3XWtbMh1Uc
         v2Nqyy/3wHsd6b0G4JehbYnTdot4SZg40FjzITOTdljnqq3dty42dNHXS0UcNe+MwsdN
         0hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093245; x=1792698045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=s9EwnjfRVlGdej+D7boyDZSAB8qLqsBqNYXpqanxFkLeYb0EN+yGFJ2aJJN1AtNqhf
         ls3DfK8Cxt3bqtnLbzJBKH1lipUmOFroHOhKtwDrT66g9ETP2JFQ5i5C1ECIdqHyFn+I
         oJWOiQ5elkekZZ/7Obft63dFMfutSph3Lzrbk/VzHaL7XbaXFzvkp1sYEYSMyef3MusA
         Beeb12sTo7zP1IbiD+HY9228GKlJxJS+Hr4GDVNpzSP2SNRNoxdRh5ejwZl0Sisx+3k+
         h4dBQQp9VTiNfm1RS/N0jInSq9p1J9su7UxIMgxgpPwv4/G8jnCBPxf4oCsOycolmVGr
         rX8w==
X-Gm-Message-State: AFq9FYLPrlJd9wwRgimmXcjUDTLoouoAGYqf9CpzY3Rv5v7QkmpOsr7Z
	c9xIsgBMNUIUHyw0b0bMqDXQE753TZERWLgbmAZt5walxg6+Crpd6Ujw
X-Gm-Gg: AYBFou1VqeT6DRoUyJHpWKDOCc06ZBOiRPraGUowp3P1hpnP1+8zMvFJ7LI9fwi3GRf
	dW0xIn1Bm/F2J7Cx/sM8KYtB9PszwgC3OObVf9ZQZtNVU0OKwQ1EwCInY1p8iqy00RClo35dDdZ
	2wWp5ilP2B5X2FsDYyJFKTrqFQA294nrei+WQXIbLluLtzNzXFsoDCno8LWD7e9bLoCg0DH7otB
	M5kqQFRhT5xz/Va5MIArFX2J5gyJPKlRcD1rh7drgy2B48wZyC8ebV9wDKUjFtmy+vD4Wk1MPGD
	LdwZwTJODqrLd9SHD1Py1DqYC0jD3p8pQxQ2R0SSuF0O0baSST8s0n5qPh1ytGuk9cJBW6GOCjN
	nlQkCzHBTJCRuxgyeQlgqonhryScyL+LWIPlzycvJBme4AeEhyNvMZU0eJ6U+ilZ9MkeK4PCCAJ
	9HYqiqQlIGbFy+TCv49AZTlOSL9TAe8HyW1OBcJWTDshQMBaufRZkDTQZwP3cCAFC6CmSF2FbQE
	1qf+8sNa+jZ3fsqhrA94OXA1iBJ4lWfKJya0xhoBpWhtII3/dtAthOlCUKZt5+Md/FDsbZKE1fB
	EX7v9UganctoNRKt
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr39361187f8f.52.1792093245329;
        Thu, 15 Oct 2026 12:40:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm195253f8f.4.2026.10.15.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:40:44 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Thu, 15 Oct 2026 19:40:43 +0000
Message-ID: <20261015194043.1597422-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202610151637.5srThc2q-lkp@intel.com>
References: <202610151637.5srThc2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct octeon_hcd comment opens with /** but names its members
without the @ prefix, so kernel-doc sees none of them and warns about
every member. aebbc7d63407 added sof_timer without a line at all,
which the robot reports as a new W=1 warning.

Prefix the members with @, drop "pipe", which is no longer a member,
and describe the three that were missing: periodic, nonperiodic and
sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
afterwards.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 drivers/usb/host/octeon-hcd.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a..d6ba52b 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -348,20 +348,23 @@ struct cvmx_usb_tx_fifo {
 /**
  * struct octeon_hcd - the state of the USB block
  *
- * lock:		   Serialization lock.
- * init_flags:		   Flags passed to initialize.
- * index:		   Which USB block this is for.
- * idle_hardware_channels: Bit set for every idle hardware channel.
- * usbcx_hprt:		   Stored port status so we don't need to read a CSR to
- *			   determine splits.
- * pipe_for_channel:	   Map channels to pipes.
- * pipe:		   Storage for pipes.
- * indent:		   Used by debug output to indent functions.
- * port_status:		   Last port status used for change notification.
- * idle_pipes:		   List of open pipes that have no transactions.
- * active_pipes:	   Active pipes indexed by transfer type.
- * frame_number:	   Increments every SOF interrupt for time keeping.
- * active_split:	   Points to the current active split, or NULL.
+ * @lock:		Serialization lock.
+ * @init_flags:		Flags passed to initialize.
+ * @index:		Which USB block this is for.
+ * @idle_hardware_channels: Bit set for every idle hardware channel.
+ * @usbcx_hprt:		Stored port status so we don't need to read a CSR to
+ *			determine splits.
+ * @pipe_for_channel:	Map channels to pipes.
+ * @indent:		Used by debug output to indent functions.
+ * @port_status:	Last port status used for change notification.
+ * @idle_pipes:		List of open pipes that have no transactions.
+ * @active_pipes:	Active pipes indexed by transfer type.
+ * @frame_number:	Increments every SOF interrupt for time keeping.
+ * @active_split:	Points to the current active split, or NULL.
+ * @periodic:		Pending TX FIFO writes for periodic channels.
+ * @nonperiodic:	Pending TX FIFO writes for non-periodic channels.
+ * @sof_timer:		Polls the block when the next periodic transfer is
+ *			due, so SOF interrupts can stay off until then.
  */
 struct octeon_hcd {
 	spinlock_t lock; /* serialization lock */
-- 
2.53.0


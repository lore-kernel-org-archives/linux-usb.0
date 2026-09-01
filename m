Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8583515C0
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291071; cv=none; b=aMTWfaOFJHvL/LvTEZ54dAatARExIRc4z+HpGA/bR21lzRi/kvCXDftieQ3QIJxjdKZilgkZBRXQPwObLrv6yFHdXV+ebcKG9aC7nAlLrX2xU/zV9dn+PVBvRNdLN84/t6l/tudwfoP62VEb+OKhiLJ73Ps2vQEF0lC+Z0kmElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291071; c=relaxed/simple;
	bh=U3cg2HZXuMvptHjkBFTYt5bfXW88OFJuT/0Bf1xnlX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcGU1JOdTzY5wsURREcfd9R7U216BgWuCuQCCybzDyv4HXvoZ1pmgDpeFJ9RBWlOtgiY9hBvutHcIXJ/VNoLHuz4X8QdZwQ3FfQoc3Nh6b0qoi+vNgSa5Smie7V7nr32aW+Gxqht05Ad57zg1mgvqrfbzm+0VpnvVkifUJ5d+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1bvlaze; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1bvlaze"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso1995865e9.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291067; x=1788895867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQGtLovN51OKFL0wAwiQ9djvDcePQibjWbjxoUKoFt0=;
        b=F1bvlaze4fUDcyxrNAXR5kgD4XWHmni+LnDjWrkGAKVuKo0J2ErgvAe7FFicUnfTL8
         pCWZXyn66o38v8+svAEqWBqhaXm77bjOkcftR1NA1AdojrGw5DDOqPGZG8R8F416NZq3
         MBAIiowQgs7RA8FiIWz776V58zneSmekASV8qE6zS1+zYWhkUT/8hiGiIc3RrsIymu4p
         WepdEw3vMJ10k1fzKL+MVBtNZA0iw458m1jRvBvUjECcCzDfYQvh5tJJvseA0CBvi6Jo
         4bdqxxLKuQJGZFlxX6MWQiE50JNgCwRcDALfhuZ1qjxzcCSs7wEWruTOOSB2XEjw4EBI
         ne/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291067; x=1788895867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQGtLovN51OKFL0wAwiQ9djvDcePQibjWbjxoUKoFt0=;
        b=BRKKM1TJ3TaMbpcYSyTKw+OUb74m9vsPmHrj9fzoIt5TzTckjy+RlNywa96ltx2H0q
         GL+QxuE257gBS5GDTU8Bm2oWl+OSY73n2P4xxJw/2V2VDDfFI9L86grV2e/mVeFApB0G
         3AjHFTHv2bwgIygKJ0/aQ1uYvIlCSRqMIn0MDEhjodG8FpayX8wOpFhTRdOyRI3SAnAi
         zq8HmCTRKiLkpKLDdaAJysQfuZSeyvT6v/BUCY7IHjoBxRURMfPA0k4IC/KO88n99CB8
         8pcUjh8uYKYxlWP4QTxwbZfjvOnLMDOVqUk9lwhHncOofPoQ8dOhyqy8/zMtUl1xt9O6
         oFNg==
X-Gm-Message-State: AFuF++lpT8TWAW1RJFOFbo/kUs8r4X1FUHvEYG4667qnofHxR1GdIqIL
	xjX3m94YSK3ANxmWeiaPI3c6E2vXsoXnzezosVaORbD2KVNjO5hceEZ7
X-Gm-Gg: AYBFou38ZfWqaJbZtC5KsV5XVH9+s5WTBXC/7GwYzqJm6JJoucBrVJnVPmF3GH/xIQd
	S+rFaydpQL9KkDfWTpFz2h7bvwZPAtAPeR7wpLxj5K9xOb473GAcazFNWH1G9+fXb3+RKYc+1ka
	TwD6CcOfVxhtZTv4NPs+vtWVdCmCfEDwwSR/Wh1w4VcU5W6dbZsMu9Fp98uJr5tAaeyd38CxTJ5
	ioINQpbYg/UzkM7Jer9Zdcr/xv9INIGNWvrL3XiXlGXG+1aEXWSftcdzxF3CxTb60EsVD1eIoXT
	y5RKonURs2n0sWSYuHmPJGB1TOnSfJ3d3FB9o1npvCdiTGAlRPGhofo1BgMkbTp1NBYWhbBuCmR
	OZaK6oSREB5PQm6UoJtPJVo3r4GPqMLyAIZbjgSzXvJlF6uD3oEUUqrcPpetxAR4Q/5VdNpM2EB
	qooAH64HYqIck/fwkTfFWKcMNBtpozrfgEIkc9vdGrbsY9gpcQhIxqiBATj3ssSM9mY9mtW3ZwK
	98eE2CApSioXjRDDD2jYoDoWo2KFGXJrz49OuUhiZ3zoGo0ohnrZhEGlYJClbkq8NUUQH4+fFvL
	R7HvFngKrJsrAABd
X-Received: by 2002:a05:6000:220d:b0:484:3d1b:7871 with SMTP id ffacd0b85a97d-48449f367eemr962710f8f.19.1788291066529;
        Tue, 01 Sep 2026 12:31:06 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:05 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] usb: octeon-hcd: fix the FIFO-flush timeout computation
Date: Tue,  1 Sep 2026 19:30:27 +0000
Message-ID: <20260901193100.1352110-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_wait_tx_rx() computes its 100us deadline from
(u64)octeon_get_clock_rate - the address of the function, not its
return value; the parentheses have been missing since the
CVMX_WAIT_FOR_FIELD32 macro became a function. The cast makes it
compile silently, and the resulting deadline is effectively infinite.

On a healthy controller the flush bit clears on the first read and
nothing is noticed. On a controller whose PHY did not come up (for
example when the reference-clock configuration is wrong for the board),
txfflsh/rxfflsh never clear and probe spins forever in __delay() -
observed as a hard hang with a soft-lockup splat on a CN5020 board,
where the board watchdog then resets the system with no console output.

Call the function, restoring the 100us timeout the code always
intended.

Fixes: 3e195a80e096 ("Staging: octeon-usb: Replaces CVMX_WAIT_FOR_FIELD32 macro with a function")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: no code change; added the Assisted-by tag for the AI assistance used
    (Documentation/process/coding-assistants.rst).

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -578,7 +578,7 @@
 	int result;
 	u64 address = CVMX_USBCX_GRSTCTL(usb->index);
 	u64 done = cvmx_get_cycle() + 100 *
-		   (u64)octeon_get_clock_rate / 1000000;
+		   (u64)octeon_get_clock_rate() / 1000000;
 	union cvmx_usbcx_grstctl c;
 
 	while (1) {
-- 
2.47.0

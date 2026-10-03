Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD0233924
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037778; cv=none; b=RkaRW42sJ4KOOmuJBuEk1E/o5Abu5oXtZz+BFxN5wZyKZN0U7QGpwkJie/gULL8B8HVG5gNSVbMRF6XVSwLa01IRN6epCYUQCalMhMbLw2HTNgTPLXAAdihSz/DYvGXmH3oo85xEL2ymQK9S09InE9m6s+GbpwDsUXGCVDXi424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037778; c=relaxed/simple;
	bh=x3qtrMaxlZV2XUClNz2Bf0GRdSf2AbVR9vfZ5ZvZwjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+xtSv60RLlsOef8b4ppBSeQyDcs3IIZXKug8wG5AXYGfo2g6eYK3dbMzy7ncP5kxUnq1Y62nTLuHQhyThOA7Rzr943X16R9WbaL+jDBsCIrdE8OHhmJ7uGuYae+StVtKwrbL/jSCmumnT/B/LjjeZMFRcoBmV15RB2uhX6+Gmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTvw0Nrl; arc=none smtp.client-ip=74.125.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTvw0Nrl"
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-49cd71f9909so2007645e9.1
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791037775; x=1791642575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgc4T+XlrOyjsjU4zUHkky5gQ77fpbAgvSWADqVH9dU=;
        b=HTvw0NrlpAcSvBc2iGuZiDZSSTf+1toLZS2koGXU/GNbizTWI0AOXRyvoQ7KZCwmj7
         jxR1wHEeokPn/LIEQeEeP4tIsJau9nBrGKSB9PSI6I+U+nWYb+f0GNXf4L6BOjuSDT8n
         vJ18irQ/eIUluRWQWqBQM+yH8aS7Rm+WhwLPzye3fSn7ALjho+5PnwCyAeIrTS/F/V1j
         h63IzTyPLZRJIP0yZMTt+LePEXuv98PfK3i8bGJnJaiAsPKScD30K8kSVg/MgC0h/rVy
         mYAAiN+jtCerlQ6WF7Qy7R5M7Pw9uvhDEMf0NOB1VDEw8L8f7g41AT9uck39MHAn8fIH
         aHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037775; x=1791642575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgc4T+XlrOyjsjU4zUHkky5gQ77fpbAgvSWADqVH9dU=;
        b=l/xKgijf4dGfrLwgH1kiGXM3DYtNbUyyYFlMSpAxYV3l7EANlWvjlhEGC3itGvgda8
         gB1lAVP24KuE0BSN6Hi5z3zosAG63UWsasejeBc+J7tAVwwcpCqxEW5Di0eNJR7bGdT+
         WJye2dWa4acR8ItnkpHFheQyYGYKOLyToNPalwtpSRs7/GKkpXvQz8qIHCmAoC33NN8K
         lsogVpHfmg6OsmDwAty4KNYhBVjRlE05tNG2f86NZ9tWPT6h678VEkqHlk8jNziy0NZc
         D6N3W1F8i8Vk1BGKl+InmKj+LeZaNxY3sCiCejbdDOsAf9iP/cHCue1x7QE1uaSGC2oY
         y9yw==
X-Forwarded-Encrypted: i=1; AKwUvBxhUdSEbPRqzaTU+ZBgcMOMPqk1yooiyJfgOcQTk3NMonf7Dsm9pweX12Q7BGOoVRkP1FycZl9hDJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mWgKVrOb/rQkp2YEiUgHuAhxFuq84e0p/bkAYFs5OEc2Zi1nGk
	EBlKkJxzh9gwiqmc9oyy9ZzAngL8fVB+sqX/d0TvBOJ88wCQbl3wxGzg
X-Gm-Gg: AYBFou3JWjJ27Aq4ahpNYlliW0Uf/+t58j5mf4qWv7yewlEr0XUZ4+rtq+Bjg8KKqpv
	/B+HzBFYYbFmQioknIdh2/6McBLepEgEeN396EOp/KxfT8GP56iGm9t+kzxxRX0k37LgBVPgNYC
	zd37EKUpDyi0JjMLc/l5l5W6OCoZzbG1eA1kWsrDh/GDTeMe+kmAENXG/WuPTXkPH24sc82xHIz
	82pA/xttxrB2kGiALhamcWvHOA1wx5w39IV+drTnzfzJpBwfvRyRBH/QNlh4SSZVDAzAZlQ2NeT
	xH6e3HciXBQFpymFB3IOw2INXjXUO7rthwJoG8nxxmegKSi8L9RkWy/ihqQCLzzha6MSIHBiKPe
	n7ePjN0AaleZGDdvLPfyjPkU17QvRIjfSr5ZL5HQrTNXfc4M8QHaYYckYWn3xtMu1NK43F82BgK
	5wyYOrqZtvhCur6RPD9oeaYk92blWGMi6duSTuGlBRc/aTmOCrmPl2byDjKMLUtQ7A2gGlx4EU3
	os4/hZ2j7cXaOM=
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr106946445e9.15.1791037775418;
        Sat, 03 Oct 2026 07:29:35 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm102612345e9.1.2026.10.03.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:29:34 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: israel.a.cepeda.lopez@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] usb: misc: usbio: Handle negative error code from usb_control_msg()
Date: Sat,  3 Oct 2026 17:28:38 +0300
Message-ID: <20261003142838.19019-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sizeof(*cpkt) is unsigned, so comparing "ret < sizeof(*cpkt)" promotes
"ret" to unsigned and negative error codes from usb_control_msg() are
not caught. Cast the sizeof to int so the error handling works.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Assisted-by: LLM
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/usb/misc/usbio.c:187 usbio_ctrl_msg() warn: error code type promoted to positive: 'ret'

 drivers/usb/misc/usbio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index fe093e7760d5..3f73f7c3d68a 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -184,7 +184,7 @@ static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
 	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
 		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
 
-	if (ret < sizeof(*cpkt)) {
+	if (ret < (int)sizeof(*cpkt)) {
 		dev_err(usbio->dev, "USB control in failed: %d\n", ret);
 		return (ret < 0) ? ret : -EPROTO;
 	}
-- 
2.53.0


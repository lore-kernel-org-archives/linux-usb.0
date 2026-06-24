Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F5276028
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301611; cv=none; b=Iqwz0TJODCPL6swUYZHT9N4GW7UP1KcVE3Hoqg4UoMTjAPSP7CCQf30TTdVe04hfkCNbTZ00qKJ06nKgIUUP4a1d+iHS551edYxJ1xsdpAsU9iZtZvXotCj3xWn1cLkynia0Pf7As4KuUj0P/wJmChO+fysdjAy7jWNEG4EBpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301611; c=relaxed/simple;
	bh=hUG3sRV5RMfHn1ZN0bBsvFTkVjqprDKCzLA//HYhC5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKzNDbhyIc+0dSSUgdrt8R2h8sds+v8xBW7JKwedxEPpIPmOXUDGDmZcn2ze4hp+vZHgKHZIFQAqnMFKb0xbhb7J62AEU+Dzmz04aPlrs6U8xt6AelCfJg1TAo4LytVkicY+aDOkj4NdiirknJRc+i1G7iDYzFUypOpmKNta+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzknugUL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzknugUL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so258582f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782301609; x=1782906409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3H5kDynZSbAePBxuJSQkwuSXPVIrHP5CTV7ASDH3eLk=;
        b=SzknugULj36b7nmStZ5gtzcWwSvFnuAI3tVQbRKO/Ajna6AcdlkDMOMyccICadm2/o
         Gi4l1GMzsgC3BkaYFgmlJKPS3sLjYzFlZb1WHPu63aLlCeftuCRD9Cpd2f9SWiA/nqjJ
         kb9qsJiM25w0AKSylYfBdrhmw0eFiVnzf0mxoR2MaFvQbxFopaa0Tpr58jJAWOxw4IM4
         so7uIHUuKNr6FzDfx3lenjMzd17c8nE2yZq6tumhPO4xA7s3sOplo6soRzaqusdpK/jp
         BDj6yDeJwaxsrr15bzLXGzxMK9KWmxvXO1Ah4RRTnbTMS1T6shd0dqSEqPdzX5M0FhOx
         nUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301609; x=1782906409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H5kDynZSbAePBxuJSQkwuSXPVIrHP5CTV7ASDH3eLk=;
        b=rv1lanmsNf7PYSdrKosUU3zq5o4HZvY0RaSaLd2EE2EIbnQZt3UAjUJ/Xz8HiVpnQE
         9H30HuUoXYq6RgpKh7wARj1Y0RwOvwyvkQ9xPiRX7hoz7pCj+8EsAfJmwi2IM73Z25RF
         mwf78AZl7oTAd2cTcISu/nrmXkrjmMQCrDkuNYruPWrE5qshIs2kxH6TEKGQYpQxfvGr
         h4K62nz2sw17M9NRDZQkDwZoXwEj3jrVsHDw8Ma3RX/VtPONhnTmi8LG2McQS/Vq228i
         CNr7S4wk0l5QFyH/eepJWIuylCBslSi3hrmKc23PBoYG6QdaG7XhG+dPKwmND4V4nVnc
         dyWQ==
X-Gm-Message-State: AOJu0YzKfmc+SavT37Exfw9qaWM5mudtyhFNfAnDs2jiih1g4H/tYTfG
	Nd7lpFkFxE9ztIQkiZ53LUrF1MJfrb1MqiAoWquQgkEsomeY2y3W7hI+sok38uNyTg==
X-Gm-Gg: AfdE7cn9QcKfwHFSIKybZ6grlP3Dfmd0J4q65kv17CEZo/r/FsH1yNVCPPoU9cvhs8r
	OE58Apu19h8wAXnPwgurOLXzOez5fGur0rsGV+u+DkukO9iMNc4SMtU7W3GMm/1KMfFpCvZAT1P
	8RFoihl/q/sY8vZOkaAe9PjJ0kutmpgsgpzqBdQ0kAp+uQBql48DuvBK3c3FxYzamejx5WnVMkN
	Y4qrNggt9zAEhfphotnglgN4dEvSvoeI2yQpi5GLXB3pi1PtZ3RaTzhUHNSD4HAl2EQK/ZhYYS2
	NcihMJJPU1OFMY7hK44IEYn1RyA5AILnTv9LHNqc6iJek7Fx8A/q0NkObkoCPzKh823bL44lWpc
	mQQeVYuCsMXKDo6HuADeZ2YidIrYhq+HuTn4XYPet1yhY99dGwcb20K/JXBas0IrYND4MAYqsbJ
	sswPDXGlAQwKpxrXQ0noBzuwo2cVsqFzwlhMsG7+BBXotFseqQAxUbmsLStIzpn9mpryYx8mWPM
	qNUR//BerSPP2xtOv8bWpOmOx3zKBKfndrBPXbE
X-Received: by 2002:a05:6000:29d0:b0:462:d07e:4bc4 with SMTP id ffacd0b85a97d-46ad8a3a16fmr8045661f8f.7.1782301608585;
        Wed, 24 Jun 2026 04:46:48 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-0.broadband.mtnet.hr. [92.242.248.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm6396036f8f.9.2026.06.24.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:46:47 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] usb: dwc3: fix kernel-doc string in struct dwc3_ep
Date: Wed, 24 Jun 2026 13:46:15 +0200
Message-ID: <20260624114615.18593-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation currently with make htmldocs gives the
following errors:

  WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
  WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'

This is because the member variable regs of the struct dwc3_ep was
removed in a previous patch. Remove regs from the kernel-doc
string, fixing the warning.

Fixes: abdd1eef04f0cb3b ("usb: dwc3: Remove of dep->regs")
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..034e8d7717e1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -722,7 +722,6 @@ struct dwc3_event_buffer {
  * @cancelled_list: list of cancelled requests for this endpoint
  * @pending_list: list of pending requests for this endpoint
  * @started_list: list of started requests on this endpoint
- * @regs: pointer to first endpoint register
  * @trb_pool: array of transaction buffers
  * @trb_pool_dma: dma address of @trb_pool
  * @trb_enqueue: enqueue 'pointer' into TRB array
-- 
2.54.0


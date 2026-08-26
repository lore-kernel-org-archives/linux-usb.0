Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2F41B8EE
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751191; cv=none; b=C16zu+y7MHP3q0+guVDIo/YQyCeUzus93bThdqyo8N4QIiRBVlqCS4RztT2Ecuq+yQqyMVNoyapOOM81mZWISzelb7W//cduJCQabVo3yUM2wM1C4mZha7JrFCeuhJ0aEuzhZGBWbD60osEViBdaY20lQiycwu+E9/hev+5OWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751191; c=relaxed/simple;
	bh=R3ZW9RKaxN32BXpYAccI9N8Gs4e741jgbe/d2ODVKek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+gunr2KO/1MuhiQmRAd2wNHgaY2+G4ifFVgM/2GldtDJv3HLI4F8pPMSOWxjg5ErF8VQB6QSMNagqLQ/sprMAn7X4dEZu7ff6xt3RfuBEg9DLAv6zsRQRWGj2VVf/S6VmMqLEf65cbC1/MaYDnil+Lx+Uz7qt83mceBZfCuNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVjJ+Y1s; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVjJ+Y1s"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1085264a12.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751189; x=1788355989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCIJ4IpVFGf9htX8nU3ZaMuw45e1XQFWPLoYH1UrhR0=;
        b=iVjJ+Y1sirEltSmlo+HwD+uapQcQw/ZDbCPG22Hk11QFrk+XtKvLNUJ9WpRxJzaUpD
         PDyMoLs/OIPZuf2a92vb3u9Rrs6Xy18HPlbLvJISPSN2t61yVAcZtEO+4Q6k47aj1q9X
         /HSb1wYBLcHfXb5v15i+zwKGSS0pgOHVQmtenkyzBJxT8nxoj8piQ4xCSjBQbyFXHaYM
         BxLBpY/gWiZR4icH9DrgljnlEpKTxpScCeUbPAGJpOuuTJfK2Hbj8NUkQk3WcPOfmR7e
         FGsoHLWFcwhLe+mRGcDeNQ3dM1pYkiw6bxgKAkJJcnmvjg1o1XXvGvWkNn89EsPA3rOA
         tZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751189; x=1788355989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCIJ4IpVFGf9htX8nU3ZaMuw45e1XQFWPLoYH1UrhR0=;
        b=XEDC0uwnFIBDAmYgcamlzDaO26F8EjkIzcv1JuxHRi6PjRfZgdrkE15R+6+hJefDrs
         UO1izEUwFOpZed+FhqC45ejzeDZrIB2vPpaSeFd7pnKo6dIEjWYeBjI6hID47Jf2Md9+
         2CNgzLg+2zxUyUe30uJpLFKqhj9yBM6drNcWysiyBHAtAnrx2hsI76yblY8YT8PKmfnn
         b7EzVx8/EtfPRv+QiQMtD973CpwU0NAZxxXHi/m3Iq41W9BlCSyLDy/xdi2dOK9Xk+o6
         SlepLv771r6HE7Uu/IhQCoNvZOJ2Cs3i7PCjgWtlJ1q64HT3Qmw51zLVsscIUry3Jely
         Os7w==
X-Gm-Message-State: AFuF++kmJ51AaffVPZ4hV2sIcxG9NRlfJuR38HwsEP3eKYMn6tKBMUOG
	ZMCYyC90N41BjUez1BqYiznCDPyuqKfImvAAJeaYxvfPnMYW7KLPlYlF
X-Gm-Gg: AR+sD119/4f7XopSYe1dzVx9EFOGl+r8ezO2ktHHB14FcyqU+MHRAsVq5B8P9E51HNb
	Han3a7pIfVQMzItETCf+D2IvUAJGgzFpjy+CKPsKqnNjvS50epENKWTZMBQB4U6+92D2GSEDHzt
	+m2NykLkxzOxyVst1zy7lEKYzJAvGTGbb+7Uk0vwXqBYSPMFy2YLL2Zj5tU/Ckbbdm6Ctc7UB1e
	JYyLM/lwoYR6skPIb0n+k/HvdrVaovMgOTSCloluye8bCTKYSwY4QQOul+yzVpxGOF2CRaxB2T5
	dXeqWXywODGLVkzPji2JpRf8tt8NYefGH3J6jjsKee/hUrgpLthQFVKnSg10bh5kkJLhdZ51BCM
	N9nhgCac/AzV9VDUlBHHGsYarmO9hYRc3iqtVgSR4KR8fZSz9Ta4UpwOtfJggPKL8z0oPPgtjMC
	YptMulxkGmF1Tbr/xUhnLGVp/mw5Q65A2vFIQOFGHo8UhKuQiD2fR1PDAbko7UV8S3qfUso+QHT
	fRP0jdNPaFx07j02uHEuRWaRhiuWmpN+ccYLE4H4xWsFVjut1EupA==
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3966d003f46mr8563959a91.0.1787751188921;
        Wed, 26 Aug 2026 06:33:08 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:7cfc:5106:a5b2:c99c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396708ba872sm959764a91.1.2026.08.26.06.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:33:08 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: duncan.sands@free.fr,
	3chas3@gmail.com,
	gregkh@linuxfoundation.org,
	edumazet@google.com,
	horms@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: atm: usbatm: fix invalid ci_range initialization
Date: Wed, 26 Aug 2026 19:02:58 +0530
Message-ID: <20260826133258.8306-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a shift-out-of-bounds in __vcc_connect():

  UBSAN: shift-out-of-bounds in net/atm/common.c:382:32
  shift exponent -1 is negative
  CPU: 0 UID: 0 PID: 5987 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full)
  Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
  Call Trace:
   <TASK>
   dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
   ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
   __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
   __vcc_connect+0x14b4/0x19c0 net/atm/common.c:382
   vcc_connect+0x328/0x8f0 net/atm/common.c:498
   pvc_bind+0x272/0x380 net/atm/pvc.c:52
   __sys_bind+0x2e3/0x410 net/socket.c:1976
   __x64_sys_bind+0x7a/0x90 net/socket.c:1979
   ...

ATM device ci_range fields (vpi_bits and vci_bits) represent the
number of bits supported for VPI and VCI addressing on the device.
net/atm/common.c directly uses these fields as bit shift counts:
  vpi >> dev->ci_range.vpi_bits
  vci >> dev->ci_range.vci_bits
  1 << vcc->dev->ci_range.vpi_bits
  1 << vcc->dev->ci_range.vci_bits

usbatm_atm_init() sets ci_range.vpi_bits and ci_range.vci_bits to
ATM_CI_MAX (-1), which is defined in <uapi/linux/atmdev.h> as a
sentinel value for userspace ATM_SETCIRANGE requests, not a valid bit
count. Shifting by -1 is undefined behavior and triggers UBSAN
warnings.

ATM UNI cell headers allow up to 8 bits for VPI (0..255) and 16 bits
for VCI (0..65535). Initialize vpi_bits to 8 and vci_bits to 16, as
done by solos-pci.

Fixes: c59bba75fa50 ("[PATCH] USB ATM: new usbatm core")
Reported-by: syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6665d3db5fef15914802
Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/20260824024620.23485-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/atm/usbatm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec0993..7b0c791399ea 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -917,8 +917,8 @@ static int usbatm_atm_init(struct usbatm_data *instance)
 
 	instance->atm_dev = atm_dev;
 
-	atm_dev->ci_range.vpi_bits = ATM_CI_MAX;
-	atm_dev->ci_range.vci_bits = ATM_CI_MAX;
+	atm_dev->ci_range.vpi_bits = 8;
+	atm_dev->ci_range.vci_bits = 16;
 	atm_dev->signal = ATM_PHY_SIG_UNKNOWN;
 
 	/* temp init ATM device, set to 128kbit */
-- 
2.43.0


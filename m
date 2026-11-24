Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509309;
	b=pX01Ch33cPHGeAwlr24KIVrsKAiMVZcH+ScnMLwpIea9ms1gO5BTiM4BRuUsQgCUO9J6
	 0Rr5lK6z6RrsB+DLlGi+rCISeVyxMOREQ/Fs432eNsNCSc2ARgId6pJLcR/q8kgRLk5h+
	 GOYyTzeL5V/7F7SrYNzkSS6GgnFYi/VxUhPuLMCj9PuveqCSCVrbdLTpEt/vsymaDjGfj
	 0/5j72u8uM56WzAvcI9AmlOqp5s6ZAb9IokumI9Z/EOof5d6jvjzaWH2UP+EG/P7KYn+U
	 d1OEqBXpJZFomQ2/iRVTieRfnqSNrer89uA6BbrNEUvAm+lrrP6bquKR39TrV/0/jBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509309;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzDThQsx1OXWglk3hx40uS8UG80cX3RMpw81XJa9SL4=;
	b=vVHPiDdxz1eFHsKt/V/i8m091UpHHpbIyl+mjLOuVGFH8MutQrrXx86irh79Pdbgt48O
	 NkE5fpLpP5YmlSSyTc2d3CWU3PaaHLqOD+X8u26I1vqLf9kL3p6sjXsmjavdRQF034T4o
	 TyzGsrnjQe2DshnabdTnmokY5f/rrBbm7m9L0tK0qhvZoOfEiU9fZcuZn0kRqvnTrPrv4
	 VMwW50XPnhvQwvXfS2r5zqvfqCeKnz42oyp9z2lhYwkItz6E15i6uup3aKMdq1M8HvnKo
	 KlJuu2FnoFDgvvFJzifaD7cRPkCrnmUdiGPH0BaD9FqG9sV5Jvr1HeCQLoo4RmPr56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=kd5xO9XU;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C71606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=kd5xO9XU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795509297; bh=BzDThQsx1OXWglk3hx40uS8UG80cX3RMpw81XJa9SL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kd5xO9XUts5rG030266/VddOK0G9w0aJlqvkqdfe9Sw511IVaHLHEXEc7IfPC36RV
	 i65qn8ylcRTIT+pYczVJt+MoM7h6Hg0ZoGMeWCpYzonuDQ5JTl8onpCXdNuFUNDZFF
	 bHl51u4fFzOLoZtWoJfaaWk5Fhw8ZiOnkIjZCybQ=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8B70F87D; Tue, 24 Nov 2026 16:34:55 +0800
X-QQ-mid: xmsmtpt1795509295tpmv9uig6
Message-ID: <tencent_574ADC21A5DB586EE40F9BE6714DC5382609@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUA0nplL9CK7PJEdiQDD1hmhYNIsnmUU0zI0W80TPS7AsR7+zJMw2
	 msZ4IINBMiYRXZCAXF4ODMnzdwcObTAkpHHi21SY5ymmeHThTbPmrFIr0m+jXKudXLp1vrFXltmM
	 I/f4eC3OrZ8ykd6YR9Bljpvs/GJd59t25p6gDbLT7jzcYAr+CW5PlF7B2xlrqvKEUNWAWRnIIawX
	 xAoH9mtxJqhtcI4CSIIvrQXSpzYVncDUJqStt7PRBTBmEBcf4hIwvdHKSWpJ6+hIRjiA0BOYP9at
	 37N71Ey3VN+MkUihb27YKNSNumE4JiaD6oBBAuznVvbR+f9iRt0LTMzbfCquknejFWMHGHUl9vvM
	 NK5gJtSf/uySHPsdtz1hwdGJqfYjXx4W0n4bprZ01pslQvqKdGxoCeTUAPSAJom0ge9IDwqsTinV
	 aubhe4f+CGcenK942xjvpDR0lPcY91I35jqIHBJPCPsvz0iTqHY4zZ/7B9SoDSw3X5cWn0AUaJkQ
	 G8JEdXQGjfEgQjjPfjyQ0bPMhPrab/ahlZglgSysP6BA1FtQvivQjtaUV7uz1tPOJj3mKofUJQtg
	 GSFztcTdP7dXWB3+8R4PF2g8rFAyQ0wNCNp32vH81AUmHXwQ3lfYSJViJVDQGbYKEBoA62dYr9+V
	 YO7NtPToYm9hV9P2PBU742o4m5nhjBhJ2cFqf9zOA4QKdlOHA89URZT3Z9Y+tJ3hpBDiTufTLE+0
	 UfOJsusAHXJ5ol/02NHCHbzVq0a/4o04WO6dhhopry30LiqIhUXOjrXAzbWvOwGpZz+J1PTK32IX
	 B9IH4CL0ys5Z2ezKTKEKT8iCfYCBLVp08FGWfkeAwJJs12bjELbPTWk+CjbU+I5goNwyexvYivT0
	 2kCWxdLu7H8XQEmEz087yYK1r70Bvvm7FBbgMCJFYlB8vV9SPYykFDv83rKpgNMz0YToMleC4eJo
	 44ba/ztP0YcYs2KtMISXCMKswu4LxWa8bWKoU8kdbb+ji6Qt1B0sUnEptWOanlr5246TKpYAgO9b
	 raafoZNV2Ty36CdxJn2npK5Gk0pQlIj5iBHni/uN70e3Nc3eLc
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+592c653b056459925299@syzkaller.appspotmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH v2] usb: gadget: uac1_legacy: fix double-close of sound device files
Date: Tue, 24 Nov 2026 16:34:55 +0800
X-OQ-MSGID: <20261124083455.2029741-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123134853.1589732-1-847807867@qq.com>
References: <20261123134853.1589732-1-847807867@qq.com>
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

syzbot reports:

  VFS: Close: file count is 0 (f_op=snd_ctl_f_ops)
  kernel BUG at fs/open.c
  ...
  Call Trace:
   filp_flush+0x...
   filp_close+0x...
   gaudio_close_snd_dev
   gaudio_cleanup
   f_audio_bind
   usb_add_function

gaudio_close_snd_dev() closes the control/playback/capture device
files but does not clear the file pointers afterwards, so it is not
idempotent.  gaudio_cleanup() is invoked both from the f_audio_bind()
failure path and from f_audio_free().  When a bind attempt fails after
gaudio_setup() has opened the sound device files (e.g. because
usb_ep_autoconfig() cannot find an isochronous endpoint), the files
get closed while audio_opts->bound stays true and the stale file
pointers remain set.  A subsequent bind of the same function instance
skips gaudio_setup() and closes the already freed struct files again,
triggering the file count corruption check in filp_flush().

Make gaudio_close_snd_dev() clear the file pointer (and the PCM
substream) after each close, and reset audio_opts->bound to false on
the bind failure path so that a subsequent bind reopens the sound
devices instead of reusing stale ones.

Verified with a QEMU setup (dummy UDC provides no isochronous
endpoints, so every bind fails): without the patch the second bind
attempt hits "VFS: Close: file count is 0 ... kernel BUG at
fs/open.c"; with the patch ten consecutive bind attempts complete
cleanly.

Reported-by: syzbot+592c653b056459925299@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=592c653b056459925299
Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interface with backward compatibility")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
Changes in v2:
 - add Fixes tag: f3a3406b3f56 converted f_uac1 to the new function
   interface and made gaudio_cleanup() run on every bind failure and
   instance free, which opened the double-close window fixed here
   (before that commit gaudio_setup()/gaudio_cleanup() were module
   init/exit and could only run once).

 drivers/usb/gadget/function/f_uac1_legacy.c |  1 +
 drivers/usb/gadget/function/u_uac1_legacy.c | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..56b9cf8fbe92e 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -790,6 +790,7 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 
 fail:
 	gaudio_cleanup(&audio->card);
+	audio_opts->bound = false;
 	return status;
 }
 
diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c b/drivers/usb/gadget/function/u_uac1_legacy.c
index 01016102fa172..f074804bba59a 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -259,18 +259,26 @@ static int gaudio_close_snd_dev(struct gaudio *gau)
 
 	/* Close control device */
 	snd = &gau->control;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+	}
 
 	/* Close PCM playback device and setup substream */
 	snd = &gau->playback;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		snd->substream = NULL;
+	}
 
 	/* Close PCM capture device and setup substream */
 	snd = &gau->capture;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		snd->substream = NULL;
+	}
 
 	return 0;
 }
-- 
2.43.0


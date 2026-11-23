Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441741;
	b=0pEsn3qyUnA+5PsBCOfVM6tSeElpiswZSmVVv5jhOA58qkGN/WflmoHgpOEPNTIdE+2e
	 /pBmO4cXJGhZ+U+FtCTnqUiC1feBQ636vBeCHI90SEEhG8J00bvgE40Nkux3k50VHjosg
	 GEiySN1vNaWsXC54CUXi+2UM6J/4j801DAl2+6I78uWbv35P+Dr2aNMrzgOKcfX6qK4VM
	 8iwaG1lceKCxc5BPparXKtP6IyI4xp77vh+ztamww99Q1LwWytXiReprti+f5GfZ9acYX
	 Nvm2XEH07qEvXW2dSreZbe70sjLIva+i6hALEgtYwa+BuOBD91GALwqZraBIQ9Gr1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441741;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=l6Lf/JAoUHIb8WD2qZaUWTfzKaNUnP5AUDqdtvS1VBI=;
	b=MFlfAiXnlcPkksXfY3R6rGnm2bHHLRVq1/0G2bRu7BOGKXerLWDjtiQJ1HQZZYbcpK3R
	 IkgKGCL2FXGiG+ZcdNpn2vXSU4FES18ZVycx5pNqUG4VeZu3hAdL5fmqB+yd0bOyXxp0d
	 uC8dwEVHDmE2g9+em0N2SU080S0e3u8OtKkijvTr9YyItp4QDvnLj+7sVDnh9Dadvg+GM
	 9vC4/X2cDOBM08FDYKMFK/739J4IVzUAIaTAiyhwfwsLvxXW2RNemTFSv+VVwkVK8Kn4j
	 iFfC7RhQDTS4Ljey3DAgkOGS5LWIAA7tzUZkqb42A9IxKfEFlfFZY9DpCakaummgR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=HVxNd9TH;
	arc=none smtp.remote-ip=43.163.128.53
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671B606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0671B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=HVxNd9TH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795441735; bh=l6Lf/JAoUHIb8WD2qZaUWTfzKaNUnP5AUDqdtvS1VBI=;
	h=From:To:Cc:Subject:Date;
	b=HVxNd9THpixuIvdR6L17JNijVfhctA/ma1fkmXh5LE5NcKdK3tnGjIwm1Y1h3HBmV
	 a144aDcJ6w6YIoeoZ35t7W5NZJvI1fWF5dIWZYhE+K3i06oxdMOXQla0uMpvc3T8Oh
	 kVj24zC8DFTbTNnEaBJfMQBx136/tm608J6EfqLU=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C3582807; Mon, 23 Nov 2026 21:48:53 +0800
X-QQ-mid: xmsmtpt1795441733tevad6es3
Message-ID: <tencent_7C654BDEA5891337506C7242C8FD481A9E05@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06ihc9IQ5AIKVhy3VZW55rgEn0y2s1p5aUc4PMH7zFkxZLwTtcMsx
	 6F5YgxYzrHLLGms5ipUsE9k/sU+g0hjo2Ge3EjYv5lWIgTnOTihB/qheUZtci6B3wktgtuSPPkKY
	 YRJcDNAmAPZX0OXkTRJrxP5s+Qix0D8oebGspq7/rttesZR0S9mvoowrEx5DjBJ5WOIlrDzBPPUX
	 b1QL//Fkce7jlmM6lAtzDob+/BRACE4qqYdzKLf5xhlwlhQ9gDY8MjBQwTzBP9QXOQ+wfIACiRp5
	 jtYtwtHVWtSglld1OBQYeyaotmiwVQw7TJkFh2PIXKos4isMVyuNBNtmr4UWR3XBG/dUmfvxSx7J
	 jzjyIXIavEEdqL+pUMkrvsd5vGrQPfh5bON8pQcOI/xNbIUCX9sgEjIVXQOY8qigpgUaPpqXBdqB
	 4dndM+zQheVZa8OYThr1oV8LX5zNhj6DWt1IXhzC4Bxf2UHV7gs/kSx5tUCVWS5sXHACOTOG5OLD
	 vVsoO3PK5ELpJZuHAhyQONT47kkQGNybqx7D+4Gsq6YJ26tlVIeJO2WtCtl9Kolwu0TV4wk93EJ9
	 M8YpD9DRm8VtVJ1cmVXGUc+5e4jHBm7tgzyO9Luak4ba2IyN6bqh2C8ZVzncvrLEIuC6u7GjV6S4
	 64tJm82H79rOh0Qi0TiOs9sDbT8dpwyspiuiNU484YmlKD0Gbfy+Fin1nvUOtNJUSjXfapVltPNf
	 fKHOnnz6a79Hh5p5eg+1p0AVg48tPO6mQMdBPucGs3MVeryuVeaWHqIi9f7uBMl5Vk0yahFNmzdS
	 oIVeP9SqSV9QOmIsImgAAqDdErEE4MH4Oz32jfSd4YYeXmStaEkDk04OlS4/Pjg3xRRkeki0VvfF
	 xvDGn1g6fcTyNkRHAogHAJai//4NtM1gB7f5xjnUCFUiVJiwc1fTuK8rf4sM3IYlYrrwf4suf8M3
	 hY4DY7N2uBI2eR8LWzlMQyT6p20tekNXbYKjIUit11WB8bt29D8nxwmzdblsw2h5XIw9VkjYaejN
	 9d9+SP+fcAoIUcyZEEwtwgs/ZcrxOb9M5UCdQvAssstF9uoYnyIBiBKFDcJHhEc0owvsSIf8/3je
	 N3ksxa
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+592c653b056459925299@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: uac1_legacy: fix double-close of sound device files
Date: Mon, 23 Nov 2026 21:48:53 +0800
X-OQ-MSGID: <20261123134853.1589732-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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
Signed-off-by: Shuai Liu <847807867@qq.com>
---
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


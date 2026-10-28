Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212130;
	b=r3sIVl8/3gtrtpPapOWU6Q8KqWwWYCFup9PgE87IpYOPw1fBVZDqW5B8eVe8PCXXYL1S
	 93RfHvNKP8KN045DjGyzkb5GPKf3PSxdFOS2i/B0AaE7+NgxmhjUd0b/VwD9ITwS0m7WO
	 BGAnxiN/Q9QDPmJi84ZUB1jQEhFuKWSHaH2ttGIKLo7j0PaDz51HPhR4WFIt3SiMl9D8x
	 6DRl+L+NU94wWnw04WazW41lDUk6MAIFeVf3DC5KAg4l5kgYcLeKAOF9MK1HlS8y1BxOZ
	 DjB6QieShaDEjotqFMa+aLm73aTwydA9ZaZbc7JueLW++qq3z2fk3h31H84Kjxw+3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
	b=WYmELP+D6hYUEzZvbkitwre8tKNUE3x+pzVKXqoxxZ/3ntTvlI6M3XgZ8x5GJFc5rlZU
	 PP5NlMhYbAD3qOzSFTLX59JoTjEJE4+QBur3RC0DNGFkZdQF2TxFMpQ8p/FybNEIGZzu8
	 gB466M7f3ZHliLZd8rq/+U0SugX3qfminLGxdu210mojmypUHXp22ooS4ldWMuom9uLrM
	 ITuErIxuKaWVzKFvF3CgqQDBKHNEVhe5h99Z5w8yQ44/b4P8egAKRi/K90BsRkeKm3Ap7
	 qD0RUxjbbnU+NyZNZKbmiPF1nn38VoNqEqE4xMShNHPRMb/OIiEDOhEPUUlSRMKsqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRG7yHUS;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0822606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0822606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRG7yHUS
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1846bc43c28so1549549c88.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212129; x=1793816929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
        b=aRG7yHUSDd+MTkKytJav6i+528qytXX/cKfTZLUKkB1nNUDBOEaZ8Amzxy4t282DtU
         pBjMqjP+lRsPMR+fYy2CPP+57kQLWP7ZKI+f+vgsRKftRGPydiB7vpTMPLvSULWnKAnm
         994oMs9IpZsZUItSrbIX0yd4yIsNJOb1zbb1l4xScDvpLpLF7P4CrJKVSlBJZBG9vOx+
         jcPkkgNkpdLWs9o7Fl7RwHgo0NlTe74U1BR6I1TqsQazeUZfYiFGTo6h5Nllo+MA2JgV
         hHWKeisJLPNoY+D8ZverCwkq7RP1Bi0do2RCbzyhmFBuleGhK9/LrmMeT3mEsrdnOyro
         0NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212129; x=1793816929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbKGqNfUqgTQK7tkH7alniEEuM5QCv88jvXrchkccXs=;
        b=xhh2brMSndaVXO8UaqFNZjjznbtRJsHHNiGcpDdepFl9yeyhX2huk4HGsjXaXkM+Ww
         2YPyALeBcE2+k6l4axBo4XXABFgRPD+rIfrEs4OI4DoOevbhAzG9EaE8R8Iv0GlVvhFo
         bHg/twtv4vXOBvLb2ziT1BS1KwAvkqGPCNqVvHX4jypIXB/6fpSZCny9IOwULtngPXZU
         WQnyq9T8ip2LVHcKAZBo32I0duwOA2cLOL4v0cYwk5Dw7ZJKTfcQ02ATwwpf/6EGA3fR
         T8c/u4HJFPwLMA4zDG2kxRLDXQK9PEjkCeL/YpC+W84Pxl8ddChBhWrHzIsNF/6WRmGo
         FgbA==
X-Forwarded-Encrypted: i=1; AKwUvBwHCvqcIkWjGM1qwiSND515Bazaa8Rauk7HTaKHXEKUkbtack89qh5cOD0ApVY0unQGUIUqoYIgnaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6+Ru7oJD+zpzjvbSO6Q+30MomaT3RMdbQtJdEuVPeWDKFEhpV
	ym53ztLh0QlzMO24X00DFXwrR0GWXwvZh7vGEEJxtFzMnAmZsFL4KfjfVI/Od3bp
X-Gm-Gg: AYBFou2JOdGTTnaUxsNUArwWevgpZcibsTAsPqr46u6etVJCBjDX3EI9Gu1D8yncayD
	4qtr6t3ktp5DH2DVQOniU+KhPqQeZiDl0mn1VDrGbJFkITm8zRO5feepgC51cR64JFHxKomz7FR
	empCQfdgh3NaKWuQQtUr1mjeHSfRl+O7jDF67EFYT0c0MeKBPZ+iLP1z1n+lOE64T59m62ycbEu
	TvXaUA8dYQM+2VmdKxEOFoN6+QnT1HyFjZeK73meyiPFaLTpUaYvPKZ6URKhi+H0ZFgTgUUP8k5
	+cElMc4yKUlK/AwK/O6WdDRhOnK528FecTxs0uCy0ERf94lo5sc0pQSbE6xs2r0vggMTFOrJU5S
	nf/fUiobEEf9BqdmUKh5k+ucogmI7PjYxcZS4NL0vVR2QVMOfZwPkv1EZ89TyfsZ8ySiRjsaojy
	ux6dXskmLJJB5Yi0nurqe2HMgyR1ED2omIOZgT7fOkdg3qoHHW/vABnFxBqllgZwop+XW0CFOF/
	8DVPGhwp8HTYOpVQpL4FfUnBv7mloo5i9a6dxu12Hu5Cw/JGSsPYp2VuYyy7KPoauxSqe6U1bAg
	qW0CbBlulSysYXaM1y4M9/7bNXiE
X-Received: by 2002:a05:7022:622:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1a6cd3a116cmr5669570c88.12.1793212128524;
        Wed, 28 Oct 2026 11:28:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:b53a:a25d:3477:6f54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm7111839c88.23.2026.10.28.11.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:28:48 -0700 (PDT)
From: mdshahid03@gmail.com
To: starblue@users.sourceforge.net,
	gregkh@linuxfoundation.org
Cc: legousb-devel@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] USB: legousbtower: use stream_open for stream semantics
Date: Wed, 28 Oct 2026 23:58:01 +0530
Message-ID: <20261028182802.25212-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The LEGO USB Tower driver uses nonseekable_open() in tower_open()
However, its read and write have stream semantics.

Use stream_open instead to mark the file as a stream and disable
unnecessary file position handling.

The issue is reported by stream_open.cocci script as potential
deadlock between read and write operation.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 18dd4115befb..b849bd0e9664 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -313,7 +313,7 @@ static int tower_open(struct inode *inode, struct file *file)
 	struct tower_reset_reply reset_reply;
 	int result;
 
-	nonseekable_open(inode, file);
+	stream_open(inode, file);
 	subminor = iminor(inode);
 
 	interface = usb_find_interface(&tower_driver, subminor);
-- 
2.43.0


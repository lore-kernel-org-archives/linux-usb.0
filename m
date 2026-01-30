Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB42DFA40
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769754269; cv=none; b=qJ91VS1/D3nBtmJWwZ+XTgsw8YYN1DUrzgmvuM18zDJvg+z0yQ1d8o1hyesZ0iY8ncIlrlNHB6FHPVhUz8dYMo9IOsK6yWQG7WX+MxMuTZHy6gHJHg7sqUpNFI+G//pBIuP405UAW997nSbSk2UnzI+fCs/iWuPn87AzqucTUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769754269; c=relaxed/simple;
	bh=JZq+RWSitCfzgZ2CiHKnrG856Oec619NyOwWzCipbs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOz/Ktwqjni+bE/gfl3eDQYev4naBMG1l+xEdQN5lA9OgQR8ABK6pfnYVM5aSBBgsHiHmzndmKtapwZyEFp5Mz/cx9fh7sDvkTe/piQDC6dzX5azBxEI0yXiDgCkJ78pcrWV37q3X5UlreeFrp7vlMYmGWF4xXHxKCUP9sGZkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjCNgcoi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjCNgcoi"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a79ded11a2so12562625ad.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 22:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769754267; x=1770359067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzOSDsADlZZalIjYI/NFZliyZ4zh625PTCb6VAu9b7I=;
        b=hjCNgcoiJ4j3Rtq/51yJ+mq8nZPgklCdyX7zQWfvhpdJLdVMhhD2QwprjpcHI6xX1D
         HoakEmjr0o7nLQhzJPo1kE6UGGyig/C/lKPYhexgzQokEa/CO+4aiTpE0Jh5tjgtz+nR
         Ol6QGJn/9ttmx45iLUpd12Lsr0h7Vh9RC54ZFpQf739Dwtj+iHVKC82xsbgOhefkdSAw
         WLicoDrSD8MB/8sn9XiujK3J77RrB0mwXkhrg6kRpiunevgDrhZyg3JkBj3KEw3pTJvX
         HE384U5YCmD21zywTYBUdqvpImLQGcBKTZs7JbL72dVMCpQIza7rWuVchHC0mu+LW+6M
         twFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769754267; x=1770359067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzOSDsADlZZalIjYI/NFZliyZ4zh625PTCb6VAu9b7I=;
        b=g8MVhkmaVruuAMERMyqxebe9ZpzmlTEUDHBZ33cJwA5pkskh4vZkVxStx11wk9Te6H
         SF64u/xYjDIPzzg33fU5ENNF+D5/Ide1tNCgLc14MhacI3USBEmfVyQMRe0XuXzFN9g1
         Ko89IJmd6eSl1XvfpALyqBkdZ0B+O0U1ZzSiow/4FEmwJ3Qx17CHLBWWtblo0PLaUSa0
         +b0ncSwGFADYt1zitk81mffiKn1cI0+fmsQVvC3J4hbFzlrOrIoiIkY6zkYW7jBnq9gt
         wFfGaWQTMHtJ1onD9B8scnLcdVa72p/CM/+rtLBh/W9cvYnktKnCk9RJl/X0wxrw3SWp
         qn1g==
X-Forwarded-Encrypted: i=1; AJvYcCXHRmz5ZL/ual31u+TaBhI3JibxfUNUZ7GZ5fu3tFg5f4KlNkBUNauYdoDXUAAnstQghj5GAGsd2Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoLkxFPNgXGqAguCv8A3+EjU/70EKczxROunUgdxJg65EzbOC
	V8A0BD9Pes33wnvDnA3M+F+2X52dEsiTQCLWw+Uz9zata4SWXs5suYvK
X-Gm-Gg: AZuq6aJshdmXxIWRRUQX4jFO71LhyX1XBhI7hiw9PhXpBgoaShdIvpUnfnq+E/O4840
	7VFm3SXiQacTfYQH6DeFDWTl7RUhQi4Coke19oh3C7L14c/XZCMHEyg52TNfcfbehCxpaL+vten
	4RS70+/h4vyOcdBMfQPmuvtcYOYeWmfNsyewWNW3fS97I0tcUxihLWZAOTeoPpAxfXTf3AUaYhQ
	yKfQlKtMyuIG3/NqKo7rfNB9w3OfcFRAGtO+8ZWw6NtjIxxNKfA5QSSGzMUViogX6148oOpj0zW
	99oH2wDjecoOnC8GC/Z5Izoi+ss1NCTcCcVb8k+YpRpkxCgE6IMReyfIghdqyA8pZRsk99l2SKG
	sl04bF0IHJSgBOqlYtvpCgL4Cq2TPv7Il8Im2Mo3o2KKDX6tktN/aw5pjX2X2QNOFIf2r893Udh
	nOmIvruP2MOYfAbRehVoLULshEpng=
X-Received: by 2002:a17:903:15c7:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a8d993031bmr18059985ad.45.1769754267392;
        Thu, 29 Jan 2026 22:24:27 -0800 (PST)
Received: from chandna.localdomain ([106.222.232.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f32bfsm69740915ad.96.2026.01.29.22.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 22:24:26 -0800 (PST)
Date: Fri, 30 Jan 2026 11:54:05 +0530
From: Sahil Chandna <chandna.sahil@gmail.com>
To: syzbot <syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] WARNING in asus_remove
Message-ID: <aXxOhV79TnuYaw0-@chandna.localdomain>
References: <697baa8f.a70a0220.9914.001f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <697baa8f.a70a0220.9914.001f.GAE@google.com>

#syz test
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -960,8 +960,8 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
  	}
  
  	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
-		drvdata->fn_lock = true;
  		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
+		drvdata->fn_lock = true;
  		asus_kbd_set_fn_lock(hdev, true);
  	}
  
@@ -1343,7 +1343,7 @@ static void asus_remove(struct hid_device *hdev)
  		cancel_work_sync(&drvdata->kbd_backlight->work);
  	}
  
-	if (drvdata->quirks & QUIRK_HID_FN_LOCK)
+	if ((drvdata->quirks & QUIRK_HID_FN_LOCK) && drvdata->fn_lock)
  		cancel_work_sync(&drvdata->fn_lock_sync_work);
  
  	hid_hw_stop(hdev);
-- 


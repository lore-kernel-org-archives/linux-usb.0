Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C23DA7F8
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818614; cv=none; b=fs9EXfLqlu4YUf5lkrn0KSz7wId0h8Qy4Fc5Wc1pa4eNx0fjN5sOCI68QeVy/+/010/UuvCvRl5xoVCYcJ1aTg+jzPoGFgUmSBZ11JgRkYN+bEPGildgmAfXouGWDD0x0eNH6enX8oEjrqzlfWymueA3Lzm1lqbwsYnTopD3OaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818614; c=relaxed/simple;
	bh=Wa7EMNtS/SBStCyHa0wWvJVG0R2Xdy1a2EIB8SPizDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlv7y/7o+eGpwHn2zPnNh2chqw5OjJVpJh6XipP5UI3koAKN0zqd2OhpRNzPuEf+JBU2R0FilDwEL5gNSl57AhSCsoFyYeORZsj5JOS6Oakc6vNkl0gEUxSJlU7/kRjgMdQf0Wp+w6ARDSf94q1S1FgevhDcEmRGkfJPwGxvzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKooWkvH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKooWkvH"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1630149a91.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787818612; x=1788423412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvUOAOKXuBQHrhv/+0psbsiL2fO8oAFnkMuF5lJmkVc=;
        b=mKooWkvHIue0C1aY3KZJijANtpHuFWEfvOY1RPCxRb5myPsWV/cBHu/FnN+jqJU4Nt
         N8ETBSCZKUtNs2lDpiKU/lUZUnrphkST1iAXfMo7sAH1gGc+KkYbTnSQ3hxN9r+hajRM
         3J6dQ+Ut3EbK55WsyyOFWwkS0NrK4A6W6T6s4/keSmpjcQOUtNDK2oz1dvF4LnCxtcWf
         tCNDo1+JsqFgQarJPNXu/0pvJ7JY+Gkdw/KIP/wSyfdKFz6pCi1X/TFTV1ZQhz3ZvlOl
         h6ksG5tCLPVVT0NnLCdSMGF0n9/+O2CnqaKg/8Dm6a8eI/ygZa8t2iM32TRak7wN5puW
         uLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818612; x=1788423412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvUOAOKXuBQHrhv/+0psbsiL2fO8oAFnkMuF5lJmkVc=;
        b=eCdr61dfc8HfiYlccxW/HqY3ZJYrVmjDzFrdkgljBy6l47sqILhWaprPQrQ6mlWlyL
         Wv90KSeUxIQcrFPuGuuaT8+7zTwYMq1fLwj3hsYzw1Ks/w2e3pVs8Pp5xDx9FIIDA0ZV
         nBaVzOJH2icBudC/2jxu/65DBQtdpxo+dB2mL3wYBp0qEj85jh1smZr7rCa6la7sGiBQ
         k/ofeiMsTOK1Nf0fg3RTHdkamuxfq1+mgG+nbVe/y48cjuixMpwqmzc2Tztf/U7Pjwmq
         iPE5LJ0DFuqolMYxaiL2xicN/6e8aqaeHO1zeZ7hqSAMtne1bC9TIF90CdXC4xBtOHFn
         5mOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDzSL1UdbCAcqyBFb6+wJ7EaQz9/5GzYFPVaBkOwlRo447q4ZnNi0CGCu3URfZ5kfagA7Ektu7Y1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lKggBB1ORpVgFKjxkFGJciCd/fujNEaDrVWb+klSj2ivcu+05e
	4zLSGF6fi3xruw1nMrMitbIPt0G+r4MBUewvYxTShWHvfjZhErHrdo6Ik1WnvQ==
X-Gm-Gg: AR+sD13J3n0e3JY+h4tNaGeU187/Odpp94GEfJ7t4rXYVfrBACOXe6jjamw2iau1Uxl
	AKQVg/94S8ekFgw3AIFgFXDvX0ciEq+tRp80Yhod/1V3DFEx52o1/M4j03Iw1RI9c61ADYBT0/Z
	oIz0cCa7GF0JF2KBnHpy3MSDGeNW5rI4m5WOxk0MtMnMdCDyddmz69GjCtroIkPaxTigrBT2tPB
	/60+QaAi3KWI/y15oYipZOxabhqfpmyfcvT6ne/yftMZsE7+cSYpqjmXwLDbk6kEYHQW2uLR9xe
	/WYnErXXoHJOH68rW2zA8iwlTvxJEuAjbx+D/mXgic2U3k7rdDN9gC7URWp0wsKxDjGy4HenjuP
	2gvXPCD6NP8jzfK1uDcm8wT9AIxAfoljUNgEoYq8Q7JC2AjQ+lML9X+0FHVDa3FOHRRN/RwUNlF
	4sQ0/zjbubJ1TC7PFbKWBHug/zHqkFQTQpCz3xvjC9ocMXv1MXKNhz+k2KNT9ZqfI19XvYSqnlz
	V41
X-Received: by 2002:a17:90b:4a50:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-3966d48c3e9mr24352683a91.14.1787818612187;
        Thu, 27 Aug 2026 01:16:52 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm26865924c88.3.2026.08.27.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:16:51 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: KASAN: slab-use-after-free Read in roccat_open
Date: Thu, 27 Aug 2026 13:46:39 +0530
Message-ID: <20260827081639.17185-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
References: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 903c1cf6dff9

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..505844890ed3 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -236,6 +236,7 @@ static int roccat_release(struct inode *inode, struct file *file)
                        hid_hw_close(device->hid);
                } else {
                        roccat_free_device(device);
+                       devices[minor] = NULL;
                }
        }
 

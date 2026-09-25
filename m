Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436944A0F15
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343712; cv=none; b=FSIqBKXf/1WJ1c8hjvnQMRRFWbZ0StGRN7x9EAH1TWkK01hiyDzFFzsgPy7lMJjUEcuYZ1tLHOnzOAvhxytRMY8q4Uv3eoF+e/uDjvUc1Z7V0P26sp08rTcQmMxWgxDnNDLqNjP2GYnP4+fMxQ+jajrY/R7ActB6c4hEKqnu0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343712; c=relaxed/simple;
	bh=UZwEr8ZxAYs/HWJfjpXBm9NDi8C9MpTYWZMVYdlUCWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcsBBawlCKm3yQE5ODzSotKQFmBJ9pkbU5JK0JJ3BsV/EDKzm/RxV5A//Z0Yq5Nq7C8sLi2uPjy09yzz7f3V1Q0zgtFBucD5jUD08NY5nwSK/WGxSfLumv0p6ECwoyPFvmg7DVuI2WPlPoEXP01QlY7/JtOj2FtViIO9r4jY6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3jzBxJJ; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3jzBxJJ"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7f4f0dd5507so342778a34.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343710; x=1790948510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8msee1/YC+m6/bz2byl/iRv2yTCsSoxS43rkyBrLP3s=;
        b=Y3jzBxJJ75j56bBUdJZGv9yCnlBFsZujNvy6v/7p2iy9pi1RUL7K6Day3t0Le/yXgG
         3qHNvkHd8nAFQ99eGlKCZUa0qr5Y+WsIv2BRhVdt0e7EfqW0gSScjlJxep3gbSsXgWgj
         6maus+h41OyOYdzBZV/AboisWr5WiRnAI/2YjU6LYPKRQ7hvpsQow0fZP9aLMhx8Sd+D
         ZYx8NePTfR4A0QBcsep66yaIjOiwGbe8urIR8/kv9mdOrG3ioJVUUTjgaUpw0hJ4BiBl
         sNgDprm/tT360ZEyIY2w4sFNFrXpwSDFXPj+UPEYs64+7pwIyxYxCSKSYezIT1laaTbI
         jMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343710; x=1790948510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8msee1/YC+m6/bz2byl/iRv2yTCsSoxS43rkyBrLP3s=;
        b=h6d3NsF3O6/lbP8kfjYi2dFMmS/iA8G/1LPE4FnEGf6JfPmUNnrpGn7yiJ269L/hPf
         KwJSQVLw7We32BXp70HqPbBRxvztL6JhQblXy9SuQpIBH0poH8gDR5/Y9/+tRLmoDq5n
         sXmZfdO93H6dwUIEJ+qk86sRk+98lZwZHqjpw2Az9hPX1DMY0hUVC8YvEmJ/hcU+e5kx
         M/vEH+Xni+pjmrHv6yJkho7gJw2w83UdJ3PsPlhSUvqRCyGKC4dz4w8aAFPaQsaXSWTf
         XE58qHSbF8MTmzL7k4/TyGR3U/MqrJ/HMlfCkgwTNxjx4kX3aPPwpxdMJUUwsup0uvPh
         kMTQ==
X-Gm-Message-State: AFuF++kwbG+zjwEV9GGbp5iT1xZ+GmHII45NGkyMIiCxyyf7sozqMqGH
	zsSbwoTEDHeJ+ti4yw/IPZTT1yDhzTWaM3m4BjRD9a7iKKMrpXTTnJFdK42drSGy
X-Gm-Gg: AYBFou21wEBYQjocx268ZKlbPA0+rBksIqKM9VxeaikVY7s+z0kl1Enis1LZgpYX80/
	lhi9fAJkSFK/6EQ5miHPnFJEV4gsnRoQFsk84iFOkFOv8zGQ/s06qtJk15eI3s0/vJAG06zWCp6
	aB6Y/ZeWugvqzH3QeklnmUqFzArCrBFCu/evP62fP0u3AWEnfUwj7pM5MaAS4CMp8ou90bYO6Nf
	KZ6L3zABLWZPuUiUl93HR+aRSfM+mj2Be8bSenPCHGXH4XepXRwFM6kbD4HdBGGdcL2lvSje5n5
	okeR1jrXQcnuJzGmfqZClMZxs/1F61VdsZuB+7y8+i7mMQ8Vq5EMFb/w4Wt1AsHHwbeq3aqbtey
	EQrYAsTBUj6SkCOIdmFBch0sXcqTaGF1oIuDPewwsvGjTkN+lqd7QOQlvzAZ5DtMwDUiPfuHs5o
	iV7E2OncUk0EHtAJlyVF5vu/QWTxlJXn3HfY483228XUyjsWDZlYW2bM8Bmdi8KK0YyvArd6yg5
	5OkgE8KfwkBQ8fclzZEHocN3+dYkGbNxl87BlJwYa3Dyhbf
X-Received: by 2002:a05:6830:82d3:b0:814:aa56:6f34 with SMTP id 46e09a7af769-81917f49300mr2560736a34.30.1790343709954;
        Fri, 25 Sep 2026 06:41:49 -0700 (PDT)
Received: from horydNAS.tail6ca24e.ts.net ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e33f6714sm2166916a34.0.2026.09.25.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:41:49 -0700 (PDT)
From: BurningHoryd <sjunhyuk1@gmail.com>
To: linux-usb@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic
Date: Fri, 25 Sep 2026 09:41:48 -0400
Message-ID: <20260925134148.435774-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <arVGfB1PV7kt2Llq@archlinux>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com> <20260922213218.5334-1-sjunhyuk1@gmail.com> <arVGfB1PV7kt2Llq@archlinux>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Krishna,

Thanks for taking a look. The acpidump is already up -- BIOS is still
F.05 (same as when I captured it on 8E41), so a fresh dump would be
byte-identical to what I already have; no need to redo it.

Full acpidump + decompiled SSDT23 (the table with the NPCF device) is
attached to my earlier comment on the NVIDIA issue:

  https://github.com/NVIDIA/open-gpu-kernel-modules/issues/1162#issuecomment-5779711336

Same topology as board 8D40 from that issue: NPCF sits under \_SB as a
peer of the GPU rather than as its PCIe child, which is why the open
kernel module's NPCF binding misses it and Power Management Object
stays N/A. That explains why >50W Dynamic Boost never works here, but
it's a separate mechanism from the 25W/65W split on the 65W charger --
PMO is N/A in both states, so it can't be what's flipping that.

Happy to attach the raw acpidump/ssdt23-acpi.zip directly to this
thread instead of linking out, if that's easier for you to work with
-- just say the word.

Thanks for flagging the missing Signed-off-by on the other 8E41 patch
too.

Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C144D469840
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117308; cv=none; b=jXbftj1BLth1fKetwSzkykcF80WR15o5p5JPuSPaMwonaHP+RZf3mxQ5ap/1gE3YjVslEGTwLJ03bV2E3IySZA5pLEzg3Lj2CbCg/rzQ9+a3UqCA/3wXsmivxr/OUsslbEhp32RXwyLolwavx5VfHt+nmOcYAoLH+O99MIISlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117308; c=relaxed/simple;
	bh=jZ2qMqO5eZVlGJ3aHfWX9Y4yYvUAlS6QZiIMvQHNRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrqA6rL5qhsndQs5If3ZymoVvoiTqq/Biqq0C+KEzYUXQ0IVWW6kwFl/ybx0TfrOfxxTDxkPDzDtcNih+KT3Nm6DfMJWA55JSI2jNDnVXtFCblJskF26DX2waPrB/1Quz+4M6FkT3yCS4W4E+ip8AXk3yGYLJE6crFdS8oANwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpyuaX5e; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpyuaX5e"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4765ce0573eso430777fac.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789117305; x=1789722105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxbt6VBxlFS0O7thJuARW3qejAi/zI4cNWaBhSouUn0=;
        b=YpyuaX5e9OMO67M4hq1eYSzqcEkr8QBIPK8ncaSXH6WCuH60+nXR9g0CocyjowC2rO
         ZRCmfyZxynTSVUnD88A95Y1iubtM50Xb9bht/380MDMJzCStHzC5gBC3it2ryroUsbWw
         3szAJI4nkvwNknx1D8gmvJ8reyL+mXh3WTHQcGI/ibxA84KCydqsk2WeMr/PdqAdOTEM
         /ck5cCS8p0vyCGXOGOppnNkl2FuF2ZOFz3yQjEFoUg5xGso14IvHI6aJbG+OyigwBjpi
         JVy7sQ+wPeIzm722MqD5kWPJ4e3izsHILX1HCQM9z13O6OI/AcsEZQl83zMUgeG0DfZS
         f+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117305; x=1789722105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxbt6VBxlFS0O7thJuARW3qejAi/zI4cNWaBhSouUn0=;
        b=fGJ5ImFNdlGM+KW1Ku9xf1B67xq8xiVLn8wj9Anib0foou7fHvFUBf80MdHvy6MeES
         8eDPA3zqsaHMxjnx5tXaSSc6+C+Ynjx0blgb0VD1ZiUceKmUus0W+SDJnA31oU0TRnj/
         WnoluOvj+QOQuXOMcwCVa8IUe4xw31y1tWsINjmJwRlaYpKELt1BA3rxmRp0ot8OR9hb
         FcNctREjEUfQAuzrGyQsmwHyx+iezr3o9J8kiZCv0jaLmjrAqGsDfou/hrFYwAv48N7g
         HMuer2SD3qJSro+Xw0hm5S1F5sci593H+vW55aQpj3+JIFfjg6+k7gD8PbRffp7FtuR6
         AcbA==
X-Forwarded-Encrypted: i=1; AKwUvBwz/+XtdlwPOTdOvAIqSrKutgr3HSUUTjBIjQh2YL3X1+CW2ZqyjmC50nHo9Td8z6MAeKOAGdchlS4=@vger.kernel.org
X-Gm-Message-State: AFuF++k3ebtDJT6+xwyfly3T4UX5amIuzaQlYicjGMERgp2G1R8dTMFu
	S4+K9cs2+/56h5mMT60eZ6SZi04O53OiEHND1bMsDJz6b4zbgJHxTtN7
X-Gm-Gg: AYBFou3iP3se3kIEEY10+p661I10M+4DOZR11Hdl+GWzbZ5H8sxUYyi1US1uBFlGayT
	TbW06KKMYg/ehS8xPMC+4mHoEtPj2IvIpLCgcEAviZ4u/+1xM8Svwmdcunfv/CqH0EYmB2Q2qz0
	XcI3oHUuxBxtzudgjsOqzNEA7B1RlydQeNRf/XlHIPgvppccSwv2TylCNfD3igPJGqsnd7deGiK
	gS2GWVksGM4yQZ6BCr8PLa9K7z+/URXj5VKEOKEvteypfs3PjM+NE3E6OmnNGZne24fsGdiTVov
	916S9w1gjrcJO50SKbYY1gZky3o5HIFUOfUxJqviY0Enwtf8W5Q/Z66le71G97tPZycCLHPlBDD
	dtvoN79grJ0mPcM43PxVEdCGqqo2NBbnqrCZcmepCt6u7GGFp7szccSXFyhJl1HQsQTeTT3dUVO
	gOoIMupDmgH2GtFzYU26ce+HcKoXFIWkji9omSZ3Qs3a2rzsLBW+ROvqb1eI9V0faZAQitHCrTy
	4Qadz0Vej/U
X-Received: by 2002:a4a:dbcf:0:b0:6b1:b68e:5109 with SMTP id 006d021491bc7-6c0bc2cdb2amr1631376eaf.33.1789117305422;
        Fri, 11 Sep 2026 02:01:45 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4902177eec.1.2026.09.11.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:01:44 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: Re: [PATCH RESEND] usb: gadget: f_loopback: fix descriptor leak on unbind
Date: Fri, 11 Sep 2026 09:01:36 +0000
Message-ID: <20260911090136.64549-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091028-launder-jockstrap-be0c@gregkh>
References: <20260808181504.462492-1-nagachaithanya9911@gmail.com> <20260902105153.3516793-1-nagachaithanya9911@gmail.com> <2026091028-launder-jockstrap-be0c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 10, 2026 at 06:32:50PM +0200, Greg KH wrote:
> How was this tested?  I don't see syzbot doing the test, did you?

I ran the syzbot reproducer from the reported bug against both an
unpatched and a patched kernel.

Both kernels were built from the same source tree and .config, with the
same compiler and QEMU environment; the patch was the only difference.

On the unpatched kernel, the reproducer triggered 3 "BUG: memory leak"
reports in 5 iterations.  All reported allocations originated from
loopback_bind() through usb_assign_descriptors() / usb_copy_descriptors():

  BUG: memory leak
  unreferenced object 0xffff888016dad4c0 (size 64):
    comm "repro", pid 5597, jiffies 4294942168
    backtrace (crc c8d54481):
      __kmalloc_noprof+0x391/0x540
      usb_copy_descriptors+0x6c/0x170
      usb_assign_descriptors+0x6c/0x180
      loopback_bind+0xf4/0x130
      usb_add_function+0xca/0x270
      configfs_composite_bind+0x6dc/0xa90
      gadget_bind_driver+0xf7/0x3e0
      ...
      gadget_dev_desc_UDC_store+0x153/0x1e0

On the patched kernel, I ran 25 reproducer iterations and observed no
"BUG: memory leak" reports.  I also performed three explicit kmemleak
scans, all of which were clean.

> And did you forget an Assisted-by: tag?

Yes, I did.  I will add:

  Assisted-by: Cursor:opus-5

in the next revision.

Regards,
Chaithanya

Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F332D0602
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059655; cv=none; b=Pj1w0otgnxv+WgSyiaKr9wvD9EJi+uhLmITmN21o34YBn+XqoFbiVmVbMQfZfKR5UZEf7b45dP8LavisjkW4jNZfDEVGASyZ6nuBqxMlSAe5Psp18BxL78A1U1pCTSXYa5GezEZsAeUG0SFaTteplLadKrmNA6gD8kIggee5hW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059655; c=relaxed/simple;
	bh=AveADoKTyD0qMKs5efp/712wG89lKRLH/NKvKyDAXiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjwjS2mtGqtqfdsmEfUye1X4AfTX/fHcGCgDOtk2y4z6CA/+xatcEC25kc+5feWg1vQrNrNwldnq2JUa/g5Qcu1Q6KijSQOwiQL7Sw1q67jdo1tkJ25IjNrBwaRXcMcKMU9eZZjLS7M816KgU5YQcymhg/UKHKSn+QF+qF5EdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z21y5DRl; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z21y5DRl"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90ce08834feso33436476d6.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788059653; x=1788664453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=Z21y5DRlLYFRM28JALsfIaJLvSzP5DLqy6ouki1NNRPGkXdkX10q+Uj7h48qVtg/FJ
         LOan2BV0teV/5Qv3WBRFHzdN5jUwUfO8jFmINUtLM0X584710+GpheqlpwftmBjLYa+T
         BU+ac8fj6w0yOVytpBf+ZYaPgHDMLtaFyUOczIt4SQqdXTq1OuYH2v6v62xCgsbxB4ds
         JHUFg7m4sDzYwgMMaPAyIjZXOQq8QHwRaFCmFO6qYe6w/fJmEn/1l26ETvNTSMRu19PD
         49WbnFlJ4Sn8w4RkGusmeAsLCaQ51rmSn0Uo7ZRuW2rPHophYA7BkUhyknpSCzlSUZSC
         MdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788059653; x=1788664453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=m9p3orq5ZZVZchB6p+H/82tiyFRtTB4qFe8PyoEmwVSCI62optc5CokL+9Rm6NSczL
         ZdTYHUeJ347jMcphOmSpQy2DGr79ECWd2tdcWwFmGtqTe8lrX/8E0V0244TJ0JX+csX6
         9GzoiKtDJgwx1cG8FULPSDbde5T5qjEnhgCQKf7JszgqL+QaXS9v0HBmdY7sCNieFt8s
         f9UWXQZk+5CFFgxaSjKzgpaFuLeWh/G3koN2v2G/JCjr0NzmbCq2xOsps3eGbCRX22np
         vqQw5mG//IGJFenpLF1/MdHnZFRRe+rguGiVxVHZkUG8V/kqbRry3NBH/X1oTY6b2V8k
         cDvg==
X-Forwarded-Encrypted: i=1; AHgh+Rp07ImlrkKvZxro+I0pZ6lBtvSRz5zPKlxbjIpLkpaxf0/f7c3iQkZZVUBO0UyGzcefKArsQBJQQAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lHPD0KV2f+ZIUL1HH1NwcAqxcKdtlYmZHlfAkwnEq8qs0vzt3b
	6Dk9cy6hOZBcdbmnUwqTKQsa5rh7acLBJrHUaav1sqbcPdLv66aX84cs
X-Gm-Gg: AR+sD10WrjcDBTvLBdrD3G56o2/dhNOjspGLBPv4JjaSEU1ofZ0UDUof+6pFTjQHkwJ
	dM4vCdkfZpyOarZAb7/Du3cR/Zu8NXmHop3J2gTV6qiaVy3D0TaTt/zIDZwdd4abm596zSVIl+e
	sS/zM3ZHMwe0/L1g/LqagjFFdLMcGabLVfie446H18Oe+ibF4NM4GIaERItfzRsP4kgkORj0WqI
	ebyIjOTW+b8bJu4pr36YZXeBh/6EtZIxgdubwo0m1Z9aT0NPWRVIE0JtmZl6wOgfegJvl8V4jUH
	vhfIv9X38aYZdDmpv6QDmZqgxjh7HqhIjs/pCcRjSmwB8kQ1AcZ9bpqGaA7bWT3N6en3yOUIUvb
	3h2FN3azgwP/JfDF609zF6a5O/sIBLjhmzhVwuOpTEGtYIcu0ZVBSjhAQhOxwq+hA132aExzt5a
	WVGq0PLhIIemCDAmHjqrCBId+vqn3as3mWAEJ+asRxb0DivvJqQcRC/2bFxgFVMGW+Xff6hQ==
X-Received: by 2002:a05:622a:5c0d:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52fb95f7381mr255204331cf.27.1788059653044;
        Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
Received: from ubuntu ([2607:fa49:6f63:9100:2b08:ba59:b738:ac34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe82f3b7sm44463631cf.21.2026.08.29.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:14:11 -0700 (PDT)
From: Pierre-David Belanger <pierredavidbelanger@gmail.com>
To: Shixiong Ou <oushixiong1025@163.com>
Cc: Pierre-David Belanger <pierredavidbelanger@gmail.com>,
	Shixiong Ou <oushixiong@kylinos.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
Date: Sat, 29 Aug 2026 23:12:32 -0400
Message-ID: <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828105926.930033-1-oushixiong1025@163.com>
References: <20260828105926.930033-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I ran into this independently on x86_64 under QEMU and had a regression
report half written when I found your patch. Same one line, same reasoning.

Confirmed against vanilla mainline 08dbfad3f504, with v7.2 built from the same
config for comparison:

  v7.2 (8d3ae59288f1)           USB keyboard enumerates
  08dbfad3f504                  xhci_hcd does not probe
  08dbfad3f504 + this patch     USB keyboard enumerates again

The failure on 08dbfad3f504:

  xhci_hcd 0000:00:04.0: xHCI Host Controller
  xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
  xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
  xhci_hcd 0000:00:04.0: can't setup: -12
  xhci_hcd 0000:00:04.0: USB bus 1 deregistered
  xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
  xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with error -12

Reproduced with:

  qemu-system-x86_64 -enable-kvm -m 512 -display none -serial stdio \
      -kernel bzImage -initrd initrd \
      -device qemu-xhci -device usb-kbd

Both -device qemu-xhci and -device nec-usb-xhci are affected. Reading
HCSPARAMS2 from inside the guest gives 0x0000000f, so ERST Max really is 0
and max_segs comes out as 0 with the current code.

I did not see the page allocator WARNING you hit (my .config is a minimal
tinyconfig-derived one), but the probe failure and the -12 are identical,
and this patch fixes it.

Tested-by: Pierre-David Belanger <pierredavidbelanger@gmail.com>

Thanks for the quick fix.

Pierre-David

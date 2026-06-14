Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435631E84A
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781460621; cv=none; b=GeRJW8G6DhI+U5rskfh8qYD4j47hMKCjflFXtsxp4yjQrpBHsfnQq9spDeYz2Wau+ZiVu8a7lCBTiJ85dNNVcqfVsRd7OHeZNpEOckodYCTxhJMAKFV0OtQKqe4euBYINNFkzYOcWJZR05tnap0vcPiLJTVRnd1Mk2gPwLsDE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781460621; c=relaxed/simple;
	bh=Ztl320bRV0CeN9v5pgOuj9s/hyNW06jjghOIwFROCDU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ibQKcZarorJWotCQQwR9fLibIqjMUwMkUw194jmEtPMSFA/6H9ly7Ynw/J8v1lKEZL7jzBH3SqAfb8LoQJ1YdT6XQAh7qTezG5rn1SzgjCdSztA0JuFz5S3V5a3UCm7YqJQ+zhByypzR61/WPhKEq8X7nRvhA5N7EcZ6i9ZHC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrMXv0oQ; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrMXv0oQ"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7e6caac6486so3384310a34.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781460619; x=1782065419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv1A/WniXeV/9AwyHTmngGxQOjB2Zbrdkiqo3uhJouI=;
        b=vrMXv0oQrReE+7Lv/GDgygNb9Ii8CydzrclFubDeiix8rU32A2YlggAC7coQwyn34R
         PHlQ6DDKSVc7GZ5tBCCIEMNlED9XqHjg8ehQ0eYnHIwfKHzgXBRRzpCXZr+41l8ul5KF
         XRsr8Y3j/Po3gwUH3fdp1qGZ80kw1fThwpSPxNIVIMcJ/iu9qgvMk6OK7io/DuSlZDqc
         fw08ym2EMBlUE7RlPruHGs0OGmU8qXFMpD7kFkeX4jxKLS2MlEh/MzjU0VLeuQtrRD9f
         oAu6NXGZPoC6pE9ndNCWCUIM0F5N3zF2v1Jb9l9b8MjklgdwZ4OIHMtzED+1GkKQi2/A
         W9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781460619; x=1782065419;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv1A/WniXeV/9AwyHTmngGxQOjB2Zbrdkiqo3uhJouI=;
        b=P9uFvLADmVsnzTtJrakolzzbPrMMMiiqUM+QNmeUV0MFMQxpre3gbePWu5/bGFgwhv
         KawUqbEFKtMluBxDnQtxP+w+iFCSn+jKQ2aBK7tChxV7QAG880RJn4IQO12UgFpEZ2t6
         m3DtjqZTmuWf+wLkE67GqvmyITeVSLOvD6u70Vbb+qaY13I10ZjphWq3eT1OK5Nwh4bb
         urHQZUIcLmmQbnb96+gRV4Jyjpwm4vWnoG6TlSieNhw7MHnvjKWYTNQmimL/7eUom0Oh
         jz2KaWULcHa9D5yvb8hwwa+w/2Yo3vX3MPp19YUsZY14GXY5sfVTwAkAgeVPAAKQpYBI
         Q1Dw==
X-Gm-Message-State: AOJu0Yz5nX4iYUMchjlLsyamv00v8s74Yjp3IBQJpoYZ8tW+sRi30iE7
	Xe95bntDekAI4J2ieyWnwfcuo1xBDj1JZLBT/qtlv0BdnoWT9uqV++0NMLrIZ2hGjOoFErpOtMS
	t/bPMYzJ3cg==
X-Received: from jafr13-n1.prod.google.com ([2002:a05:6638:afcd:10b0:5e2:636f:6a1c])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6809:2cc:10b0:487:4d4e:bcf3
 with SMTP id 5614622812f47-4874d4ebfe3mr2618878b6e.9.1781460619171; Sun, 14
 Jun 2026 11:10:19 -0700 (PDT)
Date: Sun, 14 Jun 2026 18:09:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614181006.3648010-1-nkapron@google.com>
Subject: [PATCH 0/3] usb: gadget: f_fs: Add R/W proxy EPs and ZLP support
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are working to deprecate a widely used, out of tree gadget driver by
moving the functionality to userspace via functionfs. To do so, we have to
maintain strict compatibility with the legacy driver, as there are many
third party applications which can=E2=80=99t be modified and are reliant on=
 this
interface. Specifically, the following requirements must be met:

- The function must expose a single file descriptor to userspace for both
  reads and writes,
- It must block on writes when it can not handle more data,=20
- It must handle arbitrary write transaction sizes,
- It must automatically append a zero length packet (ZLP) when the write
  transaction ends on a boundary of a multiple of the max packet size.

Initially, we pursued a compatibility layer in userspace which implemented
a socket pair to combine the OUT and IN endpoint files. This approach
proved problematic for several reasons.

To preserve the write transaction boundary for ZLP calculation, we
attempted to use SOCK_SEQPACKET. This created problems as larger
transactions required contiguous buffers to be allocated, and, even if we
ignore the constraint to the arbitrary write size and limited it to 1MB,
the socket would occasionally return -ENOBUFS to the end user if a write
operation was attempted when other sockets on the system were consuming
more than 7MB of the 8MB wmem_max limit.

After significant investigation including switching to SOCK_STREAM and
attempting a heuristic timeout approach, we decided the best path forward
was to pursue a native proxy endpoint approach in the functionfs driver
itself.

This patchset introduces the `FUNCTIONFS_RW_PROXY_EPS` flag to functionfs
which, when set, creates an additional proxy file for reading or writing
to a pair of endpoints. In an attempt to limit the change to the UAPI
surface, we added several constraints to this proxy file. We chose not to
handle ioctls on this proxy file, as the current ioctls do not have a
directionality associated with them, and would require essentially
creating duplicate ioctls with a direction argument. To use this flag, an
even number of in/out endpoints must be created, and a proxy ep is created
for each pair of endpoints in the descriptors.

With this new r/w proxy ep, we are able to transparently hand it to the
end application. However, to match the legacy driver=E2=80=99s ZLP function=
ality,
a new ioctl is added, `FUNCTIONFS_ENDPOINT_ENABLE_ZLP`. This allows the
userspace functionfs daemon to write the necessary descriptors, configure
the auto ZLP functionality on the IN EP, then handoff the proxy ep to the
application. When enabled, functionfs sets the req->zero flag. The UDC
driver then automatically adds the ZLP if the transaction length % max
packet size is 0.

An addition, a patch is included which fixes an issue if certain ioctls
(like the new `FUNCTIONFS_ENDPOINT_ENABLE_ZLP` or
`FUNCTIONFS_DMABUF_ATTACH`) are called prior to the host being connected.

This patchset has been tested on a kernel based on 7.1-rc7, as well as a
backported version tested on 6.1. Existing functionfs implementations
continue to work without modification, and the new functionality passes
tests designed for our legacy kernel driver implementation.

Neill Kapron (3):
  usb: gadget: f_fs: Initialize epfile->in early to fix endpoint
    direction checks
  usb: gadget: f_fs: Add zero-length packet ioctl
  usb: gadget: f_fs: Introduce rw_proxy file descriptors

 Documentation/usb/functionfs.rst    |  80 +++++++++++++++++
 drivers/usb/gadget/function/f_fs.c  | 132 ++++++++++++++++++++++++----
 drivers/usb/gadget/function/u_fs.h  |   8 +-
 include/uapi/linux/usb/functionfs.h |  24 +++++
 4 files changed, 226 insertions(+), 18 deletions(-)

--=20
2.54.0.1136.gdb2ca164c4-goog


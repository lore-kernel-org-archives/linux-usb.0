Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD36331EA7
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 04:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781841980; cv=none; b=HsUMKYgfQgL67JItbzJ8SijqDlWcy7hbvPo+n0QjOaK/+RI/tiPuxwQXiDYlLO7fKTkTl9Jyl6Rw8Xb6j8amn0539pRRAo6aMQ4hoG5sByWSqpXuqceugNRyZh/9vVXqWx2DoVhLY+g9JxtvyqSrqJ+xjmAvCu/c1LOCVKVrs0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781841980; c=relaxed/simple;
	bh=L1FqLTynhh2H02aj2AOcPhobHFcRFlUfnDy4LKN3Wk0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=URPcnOlWJZF+/X6Yj/acxIY+cARGSpA1ZKlfkxtJUcmJbGk1ptLXfCCoz2+mP49aOqvGcjwjCJuwiZ/daVjlFeRj6LEvuJ0Yalpwb5dRBiFFhA82ckNKEmtqh0gIeBnmFpChvQ1QS8kdzUcfBCH3IzQDvBVwkGI+dxT+KaWpt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NkZ9ra7Y; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NkZ9ra7Y"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-4856ecace68so2849213b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 21:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781841976; x=1782446776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DVu/gBVw7sKYCm27nh8lw34RGZ8XidtexEzWLK3d4w=;
        b=NkZ9ra7YvOOYhC3/Ms4WVu5VvbkXcbBiTi0rIYFJlStilk5dlzbWI1hnL9NE+II/v0
         WFDyS57Imih/NztxswW/gZdLnbYchN5aLykTX8/Q3xFj6G1Iay1Hmav7NgeVjwe2vc0X
         9PSVLzWMSu/roH1iFaSLezm9TOZ7q2QZ9ZVurYl07B4ODooBi9qyegdN0gO9YuPA6cJ7
         /8QTehgjsBXGHI4pFkfhTQDh7BFX86jFgREqXTdj3F7dulDvDku4IBnAjyPTjx/l91rb
         Ox5JaS148nf65BN7tfQRGZ6b3cg4zmhfqI/eNtC/c2jkaiH3lvlnry4VPexZadGMm/yN
         uW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781841976; x=1782446776;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DVu/gBVw7sKYCm27nh8lw34RGZ8XidtexEzWLK3d4w=;
        b=c2llqSEj2nDsP0gjNpP2sCckNKS0axF/J7HZO7uryaqaMXARJxqlWh46u2vxVjO6P/
         BRIGScqAUg3Dhi0VHmxlU8t+o5hEkgJTdogEEouClaQURxpcH4/ymACXTPbRqkR1L7t3
         6ow/l7gA0Q1gC3G8qBsi/t5JvnQftzhPzio9xdVbo/Q3EuCsnrHYEvz/AbdXkc1ZitgG
         hMv4eEwVepheJUSigQx9vXujZvS9vPwks06QMmqybJXxf2Y9K/2ZHw+bLKopjcp2oPRM
         S5evyHfpsHhJ68j9zLw/AbRxvIVLddAhdSGAqerte9d83nBEWvxqrzQLITQTCf6gLEnj
         70xQ==
X-Gm-Message-State: AOJu0YxCA8ObWSSB5VZlPWheDA/LkW7YX0vv/IXdhVyTP4qNlqfatqn1
	r3ZzOhHa8IkN1lsd0nr6bZNZOT4U627cbLEyUtuUNzB0FE/yuceV4pgbpogpyS5UX3Hdv3RX+V5
	d311wxmjtIA==
X-Received: from iohg26-n2.prod.google.com ([2002:a05:6602:a65a:20b0:996:c302:cb3e])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1a13:b0:485:467f:a307
 with SMTP id 5614622812f47-4896ac96fcemr1740719b6e.42.1781841976032; Thu, 18
 Jun 2026 21:06:16 -0700 (PDT)
Date: Fri, 19 Jun 2026 04:06:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619040609.4010746-1-nkapron@google.com>
Subject: [PATCH v2 0/4] usb: gadget: f_fs: Add R/W proxy EPs and ZLP support
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
- It must block on writes when it can not handle more data,
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

An addition, several bugfix patches are added.
- A patch which fixes an issue if certain ioctls (like the new=20
  `FUNCTIONFS_ENDPOINT_ENABLE_ZLP` or `FUNCTIONFS_DMABUF_ATTACH`) are
  called prior to the host being connected.
- A patch which moves the read buffer lifecyle from ffs_epfile_release()
  to ffs_epfiles_destroy, fixing an issue where ep's which have been
  opened() more than once free the read buffer with the first closure.

This patchset has been tested on a kernel based on 7.1-rc7, as well as a
backported version tested on 6.1. Existing functionfs implementations
continue to work without modification, and the new functionality passes
tests designed for our legacy kernel driver implementation.

---
Changes in V2:
- Added `Cc: stable...` tag to epfile-in early initialization bugfix
- Added `Tie read_buffer lifetime to ffs_epfile` bugfix change to
  address read buffer lifecycle
- Removed 'opened_count' and associated logic to track file open/close
- Reduced `name` char array from 10 to 8 to match size required
- Updated coverletter to reflect above
---

Neill Kapron (4):
  usb: gadget: f_fs: Initialize epfile->in early to fix endpoint
    direction checks
  usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile
  usb: gadget: f_fs: Add zero-length packet ioctl
  usb: gadget: f_fs: Introduce rw_proxy file descriptors

 Documentation/usb/functionfs.rst    |  80 ++++++++++++++++++++
 drivers/usb/gadget/function/f_fs.c  | 112 ++++++++++++++++++++++++----
 drivers/usb/gadget/function/u_fs.h  |   8 +-
 include/uapi/linux/usb/functionfs.h |  24 ++++++
 4 files changed, 207 insertions(+), 17 deletions(-)

--=20
2.54.0.1136.gdb2ca164c4-goog


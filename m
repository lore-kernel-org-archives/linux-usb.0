Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A74949E8;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865404; cv=none; b=ek8YXVBBDd7/8nZNUJDIQ4FaFY16v5vuwRA6+rryD1qbI6MoPtOA3Y6kRAKWvBT437pH+fFY1jdVFfK2EaJlM3Rsv/DA/8ER78z58VRddGErPyz4kz2/SvzI09NK9jL0PdpXp3KXsAwYNGzmKyu3Hqs1DGjV2SlUclrQMN/FsyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865404; c=relaxed/simple;
	bh=yQbPabwNlDcu0lA8Xh/FOL5pkzjzn/Be+O3KXo+0Hlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YNSQl4P08dRI+6Ff6ocBGKr6XUvcIb3FLbcbWlFAtQKP6k7UyuHykTdV9wyPpEyIAYeFu+pTbPSbTyxVJbOUCyUH/V0ma3O7LCYGoLiW1xb0J5FLULdFvYX+jB9Zy9c6Qh5tbq7yDvysWantvS7MpoyCWeqDxzMLqrV6tHlDn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd//un8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd//un8j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A62E0C2BCF4;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785865403;
	bh=yQbPabwNlDcu0lA8Xh/FOL5pkzjzn/Be+O3KXo+0Hlc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Fd//un8jy7LtQ9q+oTV1Bo/EV0gOkwnmCEwrmNSxZOOfdWDlVfVrIn7QsASnB+HS4
	 M2yhlxvWHgpjxTyD7oWsthuHOwxtId0NffmdDfq77ThxuZHaFiywDFkuWWeidTYuOW
	 4HJ5csP3iXq8GVE0D2nmpyuop39dbcUgM3mGvtOZE+r+Mhqeq+WXs0zI7CHCGzoG/0
	 D4JIoBuGKdZ5jAgyZErwGmO0flQ5MLeu6M608Mbsvs+lqFihbLVtCJLmVfDwujYXCI
	 PHxMzYhM+a3ZwoU5aF0cvZfCotH64DUSkTEhitWxHzV2hkAZKsm0X6JSGaMuJIvr2b
	 03YXB6eZb+gtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82375C5518F;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Subject: [PATCH 0/2] usb: gadget: f_uac1/f_uac2: fix invalid-free in srate
 configfs store
Date: Tue, 04 Aug 2026 23:13:22 +0530
Message-Id: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQo9TQq0gXMU7aKSXKjIog3
 t2oy4/H+zdQEiaFV7GB0MLKQ8ooHwWEr08fQu6zwRr7NM7UGHH2AVX8lKe0+D/3GIUInW1CdK4
 2ZdVAvo9Ckdcr3b5v69z9KExnD/b9AA0zg6B8AAAA
X-Change-ID: 20260804-f-uac-srate-invalid-free-827cf8840137
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anuj Bolewar <bolewara@gmail.com>, 
 syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com, 
 syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com, 
 syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785865402; l=1062;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=yQbPabwNlDcu0lA8Xh/FOL5pkzjzn/Be+O3KXo+0Hlc=;
 b=/ZNmtEoK+b7WB0vx2PZ4AmfHEiUmj9vFlY1Y5u+KuFKUTbGD0bZWS1+vEOcaFG7AZFUUrWVzm
 N7R4aQayQ8NBL14WhTLJZ5Bcmk5RZty22zDJzDvGknAVllHTNcu00M1
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

The p_srate/c_srate configfs store helpers in f_uac1 and f_uac2 free
the strsep()-advanced split_page pointer instead of the buffer returned
by kstrdup(). When a non-numeric token appears in the first position,
kstrtou32() fails and kfree() releases a pointer into the middle of the
slab object, which KASAN reports as invalid-free.

Keep the original kstrdup() pointer and free that instead. This fixes
the syzbot reports for f_uac2_opts_p_srate_store,
f_uac2_opts_c_srate_store and f_uac1_opts_c_srate_store.

Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
Anuj Bolewar (2):
      usb: gadget: f_uac2: fix invalid-free in srate configfs store
      usb: gadget: f_uac1: fix invalid-free in srate configfs store

 drivers/usb/gadget/function/f_uac1.c | 5 +++--
 drivers/usb/gadget/function/f_uac2.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
change-id: 20260804-f-uac-srate-invalid-free-827cf8840137

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>



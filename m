Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126948;
	b=YkTLngQxw+R4L7syBiwA4GFpk7C0t/xyE2iRyI6X0VWFLgvd/srmblVtIXAfLzfjnFS9
	 pM9Up5oFn0aoGUQkvl6uqTmR7UpIwSGqH7ASGGtYnAFrCe6AfyM33b9cEVufx1kMptije
	 4OwIhpKJxqilXAABXfgWqN8/OiJ/B0gKf4pcHxKoEdKu26ob3Vkv/Lxu3yL9ghiTPyBX0
	 h2g1fd8HpYOm1cH7YqroTNriyfPYKczlVozuwl/GXRAIkpvsOmTYIZ9Q87RVEEthgqx6U
	 iK4uJnlDudS5U7Lqr68FtI3n1zpC3EjedQXtHB/kmNjvIh40Xf+BojI2NwCRzz0IGBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126948;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lW7t5D12/cV8HF5tldiuIWMH9KrH/kxHIhqr61lY7yg=;
	b=wUOnIhkOGkduwXhs2M+uo2xtG0OmDZzx3U/v3BdTcgIFh8RbbIFaqPA4v6e7EtT1mrrD
	 L7ObEat1y13Ex4BjknIi4mMTTBKSlea4BRs5ZjOdrYlr9lDs0a64gCSpZUnobAFm4bg3+
	 Zh163ye/hEYLzxto+9X7kX5yOOeWhtLGZ+2kEOMmq1rRTRZTIvI/+spDotkAPwT91DjFq
	 fg7bUg+csznQAvmFjxtBq5aNqUc+X51ACUVK5qsAuNNc+ISFtBZ9J+Z+VxTd1Z0VvNjcI
	 Rt32c2+s+RkjAjKsVN66lcs8H7J5CACX3qCTo9cqiGqYRvHOPibeqmO7VO3uDw7CiNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGysKKG+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B4606A334;
	Thu, 19 Nov 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGysKKG+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126948;
	b=UHM1nJp2wdqH5PRJitLvufs0Fu6AWHPiImF05K5nEwlHXcQcTiPtIohetbNC2jGXgmev
	 eJVWx9g4FRJDYYwOKfqvmFl1kJFkuCPbeUvMzqkeRLT6RzqBAmcj1eA1zxzwWQCcSE2fr
	 iGpQhlRgy6q08X2i4+JEKKRG+0RKXOvvcyRCQKBHiLcS2o3K/n9GKwWRKhoxu5n2TWfRo
	 DQNc57oLrPjdl9aZJ5MEjzvW4RzV8e1uvt/lmaaKMRpQ1XnbXo88Z/C7eUOJ1WYfYzbnW
	 o8HPzvg37HDTzTV0vmySzsqfjikVIOlvS2Yx3DRnT/h4NfsyjsyaX5z8xQmU9FMj7Rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126948;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lW7t5D12/cV8HF5tldiuIWMH9KrH/kxHIhqr61lY7yg=;
	b=BzI7BXjFyVovntFqhXEYvJjJVh68DZFuFTbHMGSNsbnVRL/9BfyIubuXpiSrUI0VGRcv
	 sjNfR4BDQSZRrQhFB6B6NysYgj1mB9KhT1eWGIazBS4s0/MS1q14HsDvPQ/D304cQIBIt
	 mgsw0FQWVTchuzv4IL6lY0/midPtIR+CadWXOm1TwyikC/V22WTLKEXa3CuAKIjBth03o
	 vinAkQykYoEa2+wPIzt3nw103N2jPpg+pEaiOb7nti8TcLmNZdkWmouaFwN1raECTNAB4
	 aN45D3L1LKzYGbvdI+X3B/qkDmVbKcuOegkfE8PvAm3GWqMUSI7N6RIX5OQXzQEM81Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D29E41F000C4;
	Thu, 19 Nov 2026 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126948;
	bh=lW7t5D12/cV8HF5tldiuIWMH9KrH/kxHIhqr61lY7yg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oGysKKG+6G9b0TssGhqvKavVVfccmmBUXcrKJYjQmKm08p74H7EafiiLkWFSUbjcC
	 ebiJwDXTQReh9WoQTcxPcPgSxprKKiyzCYea/rOIe0l88fdhqXUbinf62Z5KUjB1fZ
	 clEle1/HJl8R35VGB3tjk4KDxmHpWF/Sr5uql3qMy6/Rpk4R9/3byYzYRfh7kYNqgb
	 PJmy9VsaqDfbLr5fwBbzNG0cHBYJe4NcatVfQfSQJ0YZ2Ne7PjOxVBFKNoMRqgTaZe
	 ctBrE7MwUs0AWcTsXJK/S6w07yB+kntO58lNdnYfZOz74FzZYqdNnS67l+t6j0WiPW
	 tPXSo9q+Qle5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5EE8541B30;
	Thu, 19 Nov 2026 22:22:27 +0000 (UTC)
From: Oleh Kurudz via B4 Relay <devnull+admin.or1k.net@kernel.org>
Subject: [PATCH 0/2] USB: core: Disconnect a parent hub on suspend for
 HyperX QuadCast S
Date: Fri, 20 Nov 2026 00:22:24 +0200
Message-Id: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrCQAwF0KuEv26gGaHUuYq4iDNRsxnrxBah9
 O6C7wBvR1h3C2Ta0W3z8FdDJhkI5antYewVmZDGNImkkd+r1qLx4eBYY7FW+SY1yWk+a5kVA2H
 pdvfvP71cj+MH5I456WQAAAA=
X-Change-ID: 20261120-quadcast-s-suspend-b1d21389ac8a
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Oleh Kurudz <admin@or1k.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126946; l=2397;
 i=admin@or1k.net; s=20261120; h=from:subject:message-id;
 bh=MEMGo5g61PY933MO5JFk74iMl4YxUIg5MC75DGdWosk=;
 b=oeyFB+9TSEv7kTebJT0NfJPxoY8q8EsyAow+xcjI6Qn/S5NM8UElZzB8O5iL8iD4/dcXjZGOQ
 5mdAdBGPWJ7Bnjy1BeuSYYf/YbCRALEkaF8vXCwUcwEszD1xDQEBuuw
X-Developer-Key: i=admin@or1k.net; a=ed25519;
 pk=99OKf9VLJkjldneE6gRk0c6oTl7G+EdqRiFo4h8sH6Q=
X-Endpoint-Received: by B4 Relay for admin@or1k.net/20261120 with
 auth_id=1577
X-Original-From: Oleh Kurudz <admin@or1k.net>
Reply-To: admin@or1k.net

The HyperX QuadCast S microphone is an audio function and an HID (RGB)
function behind a hub built into the microphone. During system suspend
the HID function drops off that hub, and the hub then wakes the system
even though remote wakeup is disabled for it. On s2idle machines the
suspend bounces back within about a second. Users report the same
symptom online, with unplugging the microphone as the usual workaround.

The existing USB_QUIRK_DISCONNECT_SUSPEND would fix this if it were set
on the hub, but the hub is a generic Huasheng 214b:7250 chip, and setting
the quirk on it would also stop keyboards behind other hubs with that
chip from waking the system. So patch 1 adds a quirk for the child
device that makes usb_suspend() disable the upstream port of its parent
hub, and patch 2 sets it for the two QuadCast S functions.

Other QuadCast models (QuadCast, QuadCast 2, the HP-era 03f0:xxxx IDs)
may have the same problem, but I only have the QuadCast S to test with.
They can be tried with usbcore.quirks=<vid>:<pid>:s.

Tested on usb-next (7.4.0-rc3) on an AMD laptop with s2idle.

How this was made: I had been working around the problem with a
systemd-sleep hook that disabled the microphone's upstream port, and
asked an AI coding assistant (Claude, claude-opus-5-5) to turn it into
a kernel fix. It read the USB core code, proposed the approach, wrote
both patches and the changelogs, and built the test kernel. I reviewed
the patches and ran the tests on my laptop: with the quirk cleared via
usbcore.quirks the bouncing suspend is reproducible, with it the system
stays suspended. checkpatch.pl --strict is clean and each patch builds
on its own with W=1.

Signed-off-by: Oleh Kurudz <admin@or1k.net>
---
Oleh Kurudz (2):
      USB: core: Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND
      USB: quirks: Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND for HyperX QuadCast S

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 drivers/usb/core/driver.c                       | 20 +++++++++++++++++++-
 drivers/usb/core/quirks.c                       |  9 +++++++++
 include/linux/usb/quirks.h                      |  7 +++++++
 4 files changed, 40 insertions(+), 1 deletion(-)
---
base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
change-id: 20261120-quadcast-s-suspend-b1d21389ac8a

Best regards,
-- 
Oleh Kurudz <admin@or1k.net>



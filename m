Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795782197;
	b=DchP/l3+tcpOW7IngH9zZmjRO1T+IbAsOBLCdsDqb7sBcaUzYnwBY+Vd6llcx4ohpTxM
	 X8AhlQuWIcz8luu2fnC/loVsGLZ2C0uzGKARsuBHvz2E5hgkxqFK9So3+Ds8fPx34/5eD
	 c389zGr79hJWtXtNLtPRv9+atA0fvWpkgblfeGUEJ2LhzH4dRmJQ4VC5g5uulJO8GB3am
	 LwNUf3q+uezp57Rr9I8k3lVYiZnHqjtmC7Wz1QG77BiedCIgYiFG2ATLWRaP9TvGpT4yr
	 MSF8zWtKhD38mYbWGPw7EJngXjlwLnGlPEH2YBkHgepO9/g7Pl3LQfVbmT3dNk0hbGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782197;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NGV3zdfPAUY6XAxTMIq4OnFGKDeqL7HvEok7D+zXJi4=;
	b=u4PyRRNA5lx8kD8xq2WGR01qx34c5lLNgsDjfcyDq/sg6kyo7PWCKS7m4slrAITOnKxD
	 H11OTkRWURFZ38jH7v7lJPwMMaWHV4QjWi21gATqbf4DCF+I8GUn1LYG0bT2IqTfDl3Hk
	 HwBQE7IFVL2zC4F82Kg3uCfyzrcLcpDh+AchiWfkDG2d2VFsvSc3ibwOWmZeIKC/Fvfz5
	 JKLNZVnNjE9SoC9vRP1PkrVjsQS5IDVcetFbYkIe64ivzJ7z3HEYCXFdEZikWy7J5eHI3
	 vHytXy19cSZDx/fZVsgdaaQ4b/2SwA3MeIdpFbgFIT8YuH2D3O42is6jjHSk6yCxTZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjR3tkge;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CAB606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjR3tkge
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795782197;
	b=TW66EMMi2cSHrHWiZnmvLkMwQ0CzzVtTvzvRIzvwhFQrMq+1JYHaN6A6Piv6BN9zrf3Y
	 wQja32hOkVfJgcZumuFH6VskONHi7e1Imqf3J0ys9e394Su/p3I418NVdOCTQgovra1fZ
	 OUXjGc+QDqbCo3dh4U90SYRJZ9lN8lqU4Tq57wuJ5Cqoot4qFvAwuy8fzFJUUqL7UVr7e
	 JXfrh8fWRW0rlgm16eqbybgP+WSeb6E0rsx5A8arFm89TVe7fIRiniy7+XMYboeVdXgZ6
	 GCqS/iWTo7Pnrp5roYrw5x4Z/VYPFkcXC3RwNWKMcPoyfX7rSl8PBtuIWVjD+e37Xgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795782197;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NGV3zdfPAUY6XAxTMIq4OnFGKDeqL7HvEok7D+zXJi4=;
	b=qpzXdOcVHNDNXKVAZQdAWmk7VbtUk3s3hUC1QjKv8+yFuXqLrqHQM8gCFIH7VurAHrve
	 FFf0nPg3ZlJEbQ39rEgNN5aBB0NUAeayGv+BORdf2gqOjCoA/4J5y94GS5X/qR2eJMyMr
	 88/I85HOJxgJ6/vyfhif7TlMJUTU/t7UytQsINdY8HxjnEbS6F0oMqonMcwizAGRknX1S
	 P/PkxydHdQZzJxlyu6I1VU320/kfeCSHDIxNJ9czuSaHZBBJH+rMOULsnV1iJhR3KjgoF
	 ta9pC+O1oJam+jUl1zW3PS+uU1AC7x0ywnzLaWSrRMRpoC5UcEilJRTZ44eClg+7fdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BA6C1F00898;
	Fri, 27 Nov 2026 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782197;
	bh=NGV3zdfPAUY6XAxTMIq4OnFGKDeqL7HvEok7D+zXJi4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ZjR3tkgeGwaK7mYWmidOCjWuiuUgoiSJV79lq11+80T/JUu9NQ1vw0qo0Xg0ucGRz
	 ZPLvp2AvQIrGY3epXddojN6gPTHfCAa/hAtWuebtqNHBdXXmsWYOmBmS2BLD+RGdIr
	 5coy3+8vXh7KbjlpIxyAGYnI5LUmHISOmI7xf15u/18pCHXbxdDQuhi+4fBq2NHnO4
	 v1uBqOLmO3JsweOxiwzPVoEB4Dqp8EeVbeX7V/hdNUUDgcXBcVcFRMZ6i3+aW33tOK
	 NiMdYUgpDEec0/BoJI+lYlgZhs+UbnWlvp3+4CZAcOYIolbETON9oiNEEqVkKuOpLA
	 n+v2vTp9ll+vg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0BE944B7A2;
	Fri, 27 Nov 2026 12:23:13 +0000 (UTC)
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 12:18:44 +0000
Subject: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency on
 gadget init failure
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
Message-Id: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
X-B4-Tracking: v=1; b=H4sIACN1CWsC/1WNSQ7CMAxFr1J5jUscCFW5CmKRwdAglFZxQaCqd
 yeBFcv//rSAcI4scGwWyPyMEsdUBG0a8INNV8YYigat9IFId+jjhD4k2aEh5ZGU6veu602wBKU
 0Zb7E13fwBKYl1b5rBc4/Tx7uxn6uizXtrDC6bJMfKhJOYR7HO1a+/X+Cdf0AJv9l660AAAA=
X-Change-ID: 20261127-cip-cdns3-510c-10094b795da1
To: cip-dev@lists.cip-project.org
Cc: Pavel Machek <pavel@nabladev.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ulrich Hecht <uli@fpond.eu>, Yongchao Wu <yongchao.wu@autochips.com>, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795781924; l=3161;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=x04zYySOqW6oAsloCVLgGDTamN9GWZ6GjsXXpIAZjo8=;
 b=jy2jvFay7J6X+CuBJu/uxcCtkOiiTmflG5dxWulypM0ZufJ61IM3kLXa7x27MvK+HqgBZa6Im
 LpVfgGSWdRNDAE2lchqlBhsNdI2BOn+jhL3l3bvwcab0y6qkihQET1X
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com

From: Yongchao Wu <yongchao.wu@autochips.com>

commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.

When cdns3_gadget_start() fails, the DRD hardware is left in gadget mode
while software state remains INACTIVE, creating hardware/software state
inconsistency.

When switching to host mode via sysfs:
  echo host > /sys/class/usb_role/13180000.usb-role-switch/role

The role state is not set to CDNS_ROLE_STATE_ACTIVE due to the error,
so cdns_role_stop() skips cleanup because state is still INACTIVE.
This violates the DRD controller design specification (Figure22),
which requires returning to idle state before switching roles.

This leads to a synchronous external abort in xhci_gen_setup() when
setting up the host controller:

[  516.440698] configfs-gadget 13180000.usb: failed to start g1: -19
[  516.442035] cdns-usb3 13180000.usb: Failed to add gadget
[  516.443278] cdns-usb3 13180000.usb: set role 2 has failed
...
[ 1301.375722] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1301.377716] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
[ 1301.382485] pc : xhci_gen_setup+0xa4/0x408
[ 1301.393391] backtrace:
    ...
    xhci_gen_setup+0xa4/0x408    <-- CRASH
    xhci_plat_setup+0x44/0x58
    usb_add_hcd+0x284/0x678
    ...
    cdns_role_set+0x9c/0xbc        <-- Role switch

Fix by calling cdns_drd_gadget_off() in the error path to properly
clean up the DRD gadget state.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Cc: stable <stable@kernel.org>
Signed-off-by: Yongchao Wu <yongchao.wu@autochips.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Link: https://patch.msgid.link/20260401001000.5761-1-yongchao.wu@autochips.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[ adapted to 5.10.y-cip: use gadget.c and cdns3_drd_gadget_off() ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
5.10 has the old cdns3 layout, so the call goes in gadget.c and uses
cdns3_drd_gadget_off(). This failed to apply to 5.10.y and never made
it into a 5.10.y release, and 5.10.y is now end-of-life, so I'm sending
it here.

Tested on 5.10.275-cip80: the touched object
drivers/usb/cdns3/gadget.o builds with W=1. The same change on
v5.10.275 built with no new W=1 diagnostics and booted under QEMU. I
don't have Cadence hardware, so the failing-init path itself wasn't
exercised.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.
---
 drivers/usb/cdns3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index d0378ecd0c98..b6cb690208cd 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3418,6 +3418,7 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
 	ret = cdns3_gadget_start(cdns);
 	if (ret) {
 		pm_runtime_put_sync(cdns->dev);
+		cdns3_drd_gadget_off(cdns);
 		return ret;
 	}
 

---
base-commit: bd8b111cdf1d9897bf4d826b7305a9c16bfe5f71
change-id: 20261127-cip-cdns3-510c-10094b795da1

Best regards,
--  
Dickson Wu <dickson.wu@certik.com>



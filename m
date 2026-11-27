Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785179;
	b=5agkPBIEDMeFvQuhJVtKoA3IUZyOGvhV5gw+/6ntP6XQN8ISutEHIyMAatauGlh7NNAB
	 0oEJXQto9RiONLJblA7YraEDJR1d9dLo2RTcMvqiosPDLcjfO3oxBEWhT6F1XSuhATOsR
	 1Iux+Z5WuBu72flkl32XBxIFB5h1XiyDLt9lDJb9JeWwffj/5EtllgtY7n24ddMXkWx3O
	 AvyBnAHl4FKN5vSESj0Pf4U1Fr8MWsEe7ru9k74Zzm16JYezEa3uR/SRXjfAhkKcVR3uY
	 T4MYp7/vt6Px0VtNOBeFz27fOwIBwYM6medH3ijPnZnvG0QIcaZrHRyylAtDWqUnTXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785179;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uZ5Gh5bGkiRaGpwGaQa4gll9Iedo19Ajp/aNw+T+NrE=;
	b=I9CfZ22f6AgKX3yJbSOhubioTcuij8w70l+PxRjpI1P61X1KfveRBHOE0x6bZOjZk5/b
	 39iH+Pt+y7peQp3mMn4KnAt5NQ/Iq/Tadv5a2Jr+kfD2eK0z0NJ3esD3TZsOzEo3Yu3Jx
	 f+C4XB5S2/ScU8mpwq3IjR0NMLB6KSdUPRdVut0yW1PvRmNLww0mP2QNLT/BTYdTzh3Dz
	 gXyKqd90gecCsVaAB7BYi+oevTRL0xlwb5H0yRwzqNvrJ5JCEeV95FteT9xqAjf+M2K4j
	 QTHPi/Zxl1ci/pGHDowP8lH1IOGWzfvnQE5pabQQVijhIKPBNiYZ6Fo50CYnIRO5ihA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CO07xJY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B999606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CO07xJY0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785179;
	b=Iob6t9wYgLcUXvYs9C00GDxZYza8/Kiv71jYGHHURa5iPJpICtF6Edbo6icvKPZRYtaW
	 ttqEPSEVQWHjFz01uR1AsKq8morndIau5+yKYe5uxtjaYGvBrBcx3sZkTxAsPPwKUrPsV
	 G9dga/wHdvrZMqfybsSyutVb8QX3qGZMzFrFvgRB/nSXP8ihOXjZnldyr+CQE/ttnqBK5
	 irF8F6gJDu6F2PO9DNvRzxsk3gDkWoyT2PrOMf2KTEGOlkc+N0YVDUDKMrlYjlt6pjasg
	 YKe2U9jdmKW67abtnKRJde2OIyoOjr/iwqN+JuFQcK7SIsJQ/Jiu3QpONSz2/iTPxMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785179;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uZ5Gh5bGkiRaGpwGaQa4gll9Iedo19Ajp/aNw+T+NrE=;
	b=lbpEb8W7u5fZv99k1DGn8j8+MLVioP4xyKnBLQQN1lS/Vb5JEueoGa59XcazrxNeGSc8
	 Fq+yW45mA7Pfaxg8MYN0e9Y971iJVIosQZqDlo7PsRRh6i6YtyeDUWO2v3qa3knNPJJRu
	 UhHnUmt2gDy0V/J9P+2sqYtIYLjQnq5dEMmLmaNf9exunqT5VzRhLWd/Kz5zlE+hRQ5MF
	 6KA7op9wg64ZrQl4YTujZzbi2DqQ6kaXu551p5Xw7He4hLhda5/XKIxBpao4rysCGigx2
	 WmVYIiDznKylOSI/QQ8NiID1Q8we7jiKokZrXNWs0D3NQvlfg8PY2j4XdpvwEkkEz3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1620B1F000C1;
	Fri, 27 Nov 2026 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785179;
	bh=uZ5Gh5bGkiRaGpwGaQa4gll9Iedo19Ajp/aNw+T+NrE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CO07xJY06pQC9KiuThriqktRG4s9y7PMOTvcMSkOLc41aKOBfg0pNuUzSfQPyZrJn
	 J957LloMijhA4zRYRwcrA2hchWVlAepUTbxXPwANwMX1Lb8xWA/zCuGkN5bhmq2oeJ
	 VwmsWHXiN8l46w7v9PyfnifbBtpAZyEo2YCiYsORi80IYRvw+PNGzXC8GyxBwm6vYo
	 xHRXP/raUF2UkgMApKpjmgY65ynLdQWf78uI+J0gUtP/vwx2eQRWydtofnbKT46kb9
	 117LhCQnajhqeeNteyHk6XMhgNpgvuAACW4ZU49FGNjNthP5u/5UmN+kp/xa5kgMbi
	 3BT3XhSuKXA5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9AF694B7C9;
	Fri, 27 Nov 2026 13:12:48 +0000 (UTC)
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 13:09:38 +0000
Subject: [PATCH 5.10.y-cip] usb: gadget: f_fs: copy only received bytes on
 short ep0 read
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
Message-Id: <20261127-cip-ffs-510b-v1-1-740c3a4fb9b3@certik.com>
X-B4-Tracking: v=1; b=H4sIABGBCWsC/02Nyw6CMBBFf4XM2kFaoCb+CnHRx1RqTEs6aDSEf
 7fVjct77msDphyI4dxskOkZOKRYhDg0YGcdr4TBFQ2yk0oIeUIbFvSecRSdQekGJVU/9Ep4KJU
 lkw+v79wEYyu69l0LcPl5/DA3smvdq2mjmdBkHe1cEVN0a0p3rPz4/wP7/gGP86ZQqQAAAA==
X-Change-ID: 20261127-cip-ffs-510b-2d462634361f
To: cip-dev@lists.cip-project.org
Cc: Pavel Machek <pavel@nabladev.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ulrich Hecht <uli@fpond.eu>, 
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784977; l=4141;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=DJqW2fanrrMBxibpJCrploJciD5vVQ8YJRECDs4tOi0=;
 b=i8Hl5WVTQgwvcj1ou3S2krOCa26XAw5gHG95oKNPxSQLFQPGHMExQ9CzUPfFVArwqZOP0Rp9c
 4TC87YgFKZSCaZ6PpjuQeQ/xPCDvwdxrKOjQ3khP+FuVpLpKYTLA5vU
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com

From: Michael Bommarito <michael.bommarito@gmail.com>

commit 4e036c10e7f4df5d951c69cc3697bc8e209c6d02 upstream.

ffs_ep0_read() allocates its control-OUT data buffer with
kmalloc() (not kzalloc) at the Length value from the Setup
packet, then copies that full len to userspace regardless of
how many bytes were actually received:

    data = kmalloc(len, GFP_KERNEL);
    ...
    ret = __ffs_ep0_queue_wait(ffs, data, len);
    if ((ret > 0) && (copy_to_user(buf, data, len)))
            ret = -EFAULT;

__ffs_ep0_queue_wait() returns req->actual, which on a short
control OUT transfer is strictly less than len.  The
copy_to_user() call still copies len bytes, so on a short OUT
the last (len - ret) bytes of the kmalloc() buffer --
uninitialised slab residue -- are delivered to the FunctionFS
daemon.

Short ep0 OUT completions are specified USB control-transfer
behavior and are produced by in-tree UDCs:

  * dwc2 continues on req->actual < req->length for ep0 DATA OUT
    (short-not-ok is the only ep0-OUT stall path).
  * aspeed_udc ends ep0 OUT on rx_len < ep->ep.maxpacket.
  * renesas_usbf logs "ep0 short packet" and completes the
    request.
  * dwc3 stalls on short IN but not on short OUT.

A short ep0 OUT is therefore not evidence of a broken UDC; it is
a normal condition f_fs has to cope with.  The sibling gadgetfs
implementation in drivers/usb/gadget/legacy/inode.c already does
this correctly via min(len, dev->req->actual) before
copy_to_user().  This patch brings f_fs.c to the same safe
pattern rather than trimming at a defensive layer.

The bug is reached from the FunctionFS device node, which in
real deployments is owned by the privileged gadget daemon
(adbd, UMS, composite gadget services, etc.); it is not
reachable from unprivileged userspace.  Linux host stacks
normally reject short-wLength control OUTs before they reach
the gadget, so reproducing this required a build that
bypasses that host-side check.  With the bypass in place, a
1-byte payload on a 64-byte Setup produces 63 bytes of
non-canary slab residue in the daemon's read buffer.

Fix by copying only ret (actually received) bytes to
userspace.

Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
Cc: stable <stable@kernel.org>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Link: https://patch.msgid.link/20260419160359.1577270-1-michael.bommarito@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[ adapted to 5.10.y-cip: keep the branch's likely/unlikely wrappers around the EP0 copy ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
5.10 wraps the EP0 read condition in likely() and unlikely(). The
backport keeps those wrappers and uses the completed length for the copy.

Tested on 5.10.272-cip79: drivers/usb/gadget/function/f_fs.o built
with W=1 before and after the patch, with no new diagnostics. The same
paired build passed on the 5.10.275-cip80 tip. On v5.10.275, the
patched kernel booted in QEMU and passed the FunctionFS dummy-HCD
endpoint creation smoke test. That test covered endpoint setup. The
runtime test was not rerun on the CIP tip.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index bb0b7c1e050b..5ad3ce302650 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -598,7 +598,7 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 
 		/* unlocks spinlock */
 		ret = __ffs_ep0_queue_wait(ffs, data, len);
-		if (likely(ret > 0) && unlikely(copy_to_user(buf, data, len)))
+		if (likely(ret > 0) && unlikely(copy_to_user(buf, data, ret)))
 			ret = -EFAULT;
 		goto done_mutex;
 

---
base-commit: bd8b111cdf1d9897bf4d826b7305a9c16bfe5f71
change-id: 20261127-cip-ffs-510b-2d462634361f

Best regards,
--  
Dickson Wu <dickson.wu@certik.com>



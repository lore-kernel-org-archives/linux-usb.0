Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E81446BE2
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981551; cv=none; b=hDxqwPlfmUH1RVyLTiLV2exT8PZoTfwkm/teiv+NMWqtG+bigWqUTa2sBzKhoe5snNDH89O9Hvpa0wOUdYTpPkFqUYbH7A/A6WpuOP9eFis/T89dU5udicZfu5ELh1VpSRh5NkDNlKYYKOahiY7THSTqbsk8JPyLADAxdJ10Y2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981551; c=relaxed/simple;
	bh=WgoUXwoPUgqVhPGao7+QJ9DTMWGX+mf2qPAXnx16Ag8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlU5WlIc2nK1foSruw/dy02HOoakjNhKrXYDkAlm91DqIrqMgcERKOOk0l18sJTF1S0loeW79IXwMu3m7ojn0s6NiiVELDuQCCfK9VKha9sqqPZi/k7Om/E4BDIExKEyOXmX2Ujus40lwH+fZBqPGqEaxDtIeWBH3mwziv1oS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dKFrKwQs; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dKFrKwQs"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso60396d6.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786981545; x=1787586345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1WwIY9ZgTWoG+HT13scDb1WtDYcalENgFFGa4ZZEZ8=;
        b=dKFrKwQsqocP4v8yF4yJwzRFNR0rT5J9+hXhExXHKeqiP/AOOlHCnbSPMN2OSo0ymu
         drVhGLMurytv4f+viB6zs5zcU3yflN/oUxazEzZChvN+weTVA3TbJor+CGOzRoIjBYlU
         Bi7oM85hlRmLSq7VDTH7CLRXfPPlsQwUuZrVEiP3rU2UY22hWA5wKFEv5x8t+DmPG2NS
         bVBDwbnhM0Jq1MKL9zkNhjoBBoXmckJVsltnnzD6zh0zlQ3DlwsVqSvrPQhz8tHHs0DQ
         SHRwcRItnwoyvBjh3j1NLVt8Uvl/sSrSqz1LZI2+AsyDUaAEiMd/Yn9WB4y+m24r5mX9
         7DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981545; x=1787586345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1WwIY9ZgTWoG+HT13scDb1WtDYcalENgFFGa4ZZEZ8=;
        b=IuWVE15kPFjsNnsH3isN2wGtxF3RbuA8ryro1wEKeoh1CZIP57UxFnNP5Bwnh//704
         6d26Zyn8ArmQ14+kJ/ncYcY45dD3PBBuT2k4U8HWYf/mSlbuj0uK/8qdJt2R1zJkqsZ2
         wqnsvUzYKVzKBG6vQ9TBscPdU8+Roz29YexmhVXWseIxGVQvLxHjpT7rOiixkOCqJfby
         wMLQOnqvhgxM8SgwgpyOKioC1BTIeFYir4xws57dCw+k7qShFTUfeXu8ZzqhCNC+dTeO
         WCwpfWq01ipeti/fsDfdpozrqNvMx7CHKvFd7hIp77q5M5Fngfep5oB6rZF3VkyDdOmp
         0Z6A==
X-Forwarded-Encrypted: i=1; AHgh+RpnPnYvKnAxBl3kryIwBlFPWowCM1IUn+qe/WDBTvtDPplmvyA3OTpc20l3cT/UKRRQb9c222ivLug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AwOwIEf+Sy6uxNvdmdFaUDHAptMQXHqjosOHLX4v+VZ37TFA
	dhP9r1OWHqNDP5Hu9EHihDiw7dRh8JB98h7n9ZTBD5NBOEuh1ZuCI/JahyZ4CRmBoQ==
X-Gm-Gg: AR+sD10RpLf5tX47J8XZthAbxa0fX397NIMD/JZIxCVyKe/G+zJcOvcqr28b1zaSk3u
	B/kMPXE8Vg/GXzoYYDpzv8G4xWlnggAX/u4k9LY17nI2Cf2wE9HhVLhdqMf9almruWJ49fUIRzf
	Hl61MchtR6LElJ+JrVe30El+K40w9nhi+p4/pp2gbIL7NQj30t7EBQN7kDEJw+Y3jvmM1Q3G4ph
	u7mN35w283oOdftx9llLQ3thGLP1Y+8F39/ZZd5B/Jc6YqpbNpMnbewj+vmpMbI1jRmT66dEGbe
	21aNZmSOCg3es1z4FleYNnpGe5F+xLhFFxYt0ixzjD3S8v8uzZh+UIAKdz/nj3E5xaaa11Z7FAB
	mc0g4SOCOsKw6s5pbUV+heK2i8E2wLLYrMQmwQHXaUSEzv79tby8PuqTkkGuvDWQXYyvs3Mlhld
	7hdKMQ20k4o4ZixMXGkzCFD0XC1weLa4c+0Hg0VW1bbb5L+uHURKw4un3fhNTgiWhWEnyMk+/jG
	/i49quZk22d2atzmpe/Pu8t4idV2Hh07NBSp9AnWk8=
X-Received: by 2002:a05:6214:3a84:b0:8ee:756a:bc32 with SMTP id 6a1803df08f44-90c4cf2ed8cmr197776d6.15.1786981545001;
        Mon, 17 Aug 2026 08:45:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4583a4bfsm11630376d6.14.2026.08.17.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:45:44 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:45:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>,
	asml.silence@gmail.com, brauner@kernel.org,
	gregkh@linuxfoundation.org, io-uring@vger.kernel.org, jack@suse.cz,
	kartikey406@gmail.com, kees@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mjguzik@gmail.com, nogikh@google.com, syzbot@kernel.org,
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com,
	syzkaller-upstream-moderation@googlegroups.com,
	torvalds@ppc970.osdl.org, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
Message-ID: <34e65096-8827-470c-9a88-8c643cccef22@rowland.harvard.edu>
References: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
 <7c6ce54c-ec12-4754-a36e-d5550f8337b0@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c6ce54c-ec12-4754-a36e-d5550f8337b0@kernel.dk>

On Mon, Aug 17, 2026 at 09:04:06AM -0600, Jens Axboe wrote:
> On 8/17/26 7:42 AM, syzbot wrote:
> > syzbot has bisected this issue to:
> > 
> > commit aa00f67adc2c0d6439f81b5a81ff181377c47a7e
> > Author: Jens Axboe <axboe@kernel.dk>
> > Date:   Tue Oct 22 19:47:00 2024 +0000
> > 
> >     io_uring: add support for fixed wait regions
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10e60679580000
> > start commit:   9a143525f62b Merge tag 'ata-7.2-rc7' of git://git.kernel.o..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=12e60679580000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14e60679580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
> > dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120defb9580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16323fb9580000
> > 
> > Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> > Fixes: aa00f67adc2c ("io_uring: add support for fixed wait regions")
> 
> That looks like nonsense, I strongly suspect it's a race and hence your
> bisection ends up being mostly useless as it sends you in random directions.

Agreed.

The patch below has already been sent to the USB mailing list.  Has 
syzbot tested it?

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v7.2

From: Aleksandr Nogikh <nogikh@google.com>

A race condition exists between opening a gadgetfs endpoint file and the
destruction of the endpoint files, leading to a use-after-free of the
ep_data object.

When an endpoint file is opened, the VFS looks up the dentry and calls
ep_open(). ep_open() retrieves the ep_data pointer from inode->i_private
and attempts to lock its mutex. Concurrently, if the gadget is unbound,
destroy_ep_files() iterates over the endpoints, unhashes their dentries,
and immediately calls put_ep(). This drops the initial reference to the
ep_data object, freeing it. If another thread is already in the process of
opening the file, it holds a reference to the dentry and the inode. The
inode remains alive, and its i_private pointer still points to the
now-freed ep_data. When ep_open() proceeds to lock data->lock, it accesses
freed memory.

BUG: KASAN: slab-use-after-free in __mutex_lock_common
kernel/locking/mutex.c:625 [inline]
BUG: KASAN: slab-use-after-free in __mutex_lock+0x130/0xf14
kernel/locking/mutex.c:821
Read of size 8 at addr ffff0000f43acc58 by task syz-executor/5900

Call trace:
 __mutex_lock_common kernel/locking/mutex.c:625 [inline]
 __mutex_lock+0x130/0xf14 kernel/locking/mutex.c:821
 mutex_lock_interruptible_nested+0x24/0x30 kernel/locking/mutex.c:899
 ep_open+0x58/0x25c drivers/usb/gadget/legacy/inode.c:823
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052

Freed by task 6138:
 kfree+0x188/0x690 mm/slub.c:6692
 put_ep+0xd0/0x144 drivers/usb/gadget/legacy/inode.c:225
 destroy_ep_files+0x244/0x2dc drivers/usb/gadget/legacy/inode.c:1582
 gadgetfs_unbind+0x114/0x1f0 drivers/usb/gadget/legacy/inode.c:1655
 gadget_unbind_driver+0x188/0x790 drivers/usb/gadget/udc/core.c:1724

To fix this, tie the base reference of ep_data to the lifetime of the inode
rather than manually dropping it in destroy_ep_files(). Add an .evict_inode
callback to gadget_fs_operations that drops the reference when the inode is
finally destroyed. Remove the premature put_ep() call from
destroy_ep_files(). Additionally, to prevent a double-free in the error
path of activate_ep_files(), clear inode->i_private in
gadgetfs_create_file() before calling iput() if simple_start_creating()
fails.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
Link: https://syzkaller.appspot.com/ai_job?id=ae49a838-5eb9-4227-93a3-56ad2313483a
Signed-off-by: Aleksandr Nogikh <nogikh@google.com>

---
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51..a03062986 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1579,8 +1579,6 @@ static void destroy_ep_files (struct dev_data *dev)
 		/* break link to dcache */
 		simple_remove_by_name(dev->sb->s_root, ep->name, NULL);
 
-		put_ep (ep);
-
 		spin_lock_irq (&dev->lock);
 	}
 	spin_unlock_irq (&dev->lock);
@@ -1996,6 +1994,7 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 
 	dentry = simple_start_creating(sb->s_root, name);
 	if (IS_ERR(dentry)) {
+		inode->i_private = NULL;
 		iput(inode);
 		return PTR_ERR(dentry);
 	}
@@ -2006,9 +2005,18 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	return 0;
 }
 
+static void gadgetfs_evict_inode(struct inode *inode)
+{
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+	if (inode->i_private && inode->i_fop == &ep_io_operations)
+		put_ep(inode->i_private);
+}
+
 static const struct super_operations gadget_fs_operations = {
 	.statfs =	simple_statfs,
 	.drop_inode =	inode_just_drop,
+	.evict_inode =	gadgetfs_evict_inode,
 };
 
 static int


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
See https://goo.gle/syzbot-ai-patches for information about AI-generated patches.
You can comment on the patch as usual, syzbot will try to address
the comments and send a new version of the patch if necessary.
syzbot engineers can be reached at syzkaller@googlegroups.com.


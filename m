Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B68C0211C
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717898254; cv=none; b=Zx1nj15E9qqB+O+f3cmwDrqErvvjRWHGBFP3C1etbCYCMiWa38HBeznEQww8WFEGO5D53+nn5zhTMK8KaznF9xqAnKYfzar9mZIDZB2SVHPx1YiU3/bmizcaL5GXjIXw1CZVBl8wcJKVJrSy28PuEGc418YVW0XgJQbKW4I9vow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717898254; c=relaxed/simple;
	bh=OKxSyNLCpt84bJ2sRIOUG8HK0TRmHlit2OTn9Hhi3/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWIyjrh+wWKJNl49hiB8nQFhnawRAmZy0/DUqDtDiiwjX3wkSs5xK/o4FUuKSpziMrGb5GL6i9sMmHvv+fcy1bpuucw+4sHzjOA4c6PyL0m86Jc5O4Be7ObfrYw3x2f7kgrAYB8q5+dnq75pZ92Tb7QsWibLTuts0ZI+nSYPyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 100687 invoked by uid 1000); 8 Jun 2024 21:57:25 -0400
Date: Sat, 8 Jun 2024 21:57:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
Message-ID: <8177975b-7eff-45db-9b4b-4a6d321ac7ab@rowland.harvard.edu>
References: <000000000000b1093b0608ff6979@google.com>
 <00000000000073d54b061a6a1c65@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000073d54b061a6a1c65@google.com>

On Sat, Jun 08, 2024 at 05:28:26PM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    8867bbd4a056 mm: arm64: Fix the out-of-bounds issue in con..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=10961932980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
> dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15be6dce980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101ca30a980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/6ea21f50498b/disk-8867bbd4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e2fed09364aa/vmlinux-8867bbd4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4860173c7a18/Image-8867bbd4.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com
> 
> cdc_wdm 1-1:1.0: nonzero urb status received: -71
> cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
> cdc_wdm 1-1:1.0: nonzero urb status received: -71
> cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
> watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [syz-executor782:6625]

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git 8867bbd4a056

Index: usb-devel/drivers/usb/class/cdc-wdm.c
===================================================================
--- usb-devel.orig/drivers/usb/class/cdc-wdm.c
+++ usb-devel/drivers/usb/class/cdc-wdm.c
@@ -260,6 +260,9 @@ static void wdm_int_callback(struct urb
 		case -ESHUTDOWN:
 		case -ENOENT:
 		case -ECONNRESET:
+		case -EPROTO:
+		case -EILSEQ:
+		case -ETIME:
 			return; /* unplug */
 		case -EPIPE:
 			set_bit(WDM_INT_STALL, &desc->flags);

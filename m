Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113F309F09
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658205; cv=none; b=lNXDg+yraWZ3X1sdDOC3hBJ89IEQ26Qsc0aE12VFFNGoC+aqAIlkY7AGpgQ3/D2KaU0yyrJJ5lqZV7/HiTv1lBqTRm5Gf6/VCksoxCPdfVE7F37xhCnB53DkalYM30+5jEHV7DLKsAIF+wzbvCuRIRiPc/eCazxLdNthYXmLAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658205; c=relaxed/simple;
	bh=lMkC/ynIVDv69Gt7NV+kFoEhjnQ2FY35gYnDDaOQ5KM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sED5mQnjloe1DcP821oTUQVRCxbmpoHzR0PFdd0NZhrNL3ClD6EjhS0WFAMim7oNw7Xz2NHqNeqVAB+3+mDtYOtRApB6psG5rKH4doLdPG/JdjVANDcpyzKFYbgnba+ThhQwBBIuz69g0+y69HmjzjZQXBnbNQKizV4TFYfZ62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-66308f16ea1so15240190eaf.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 09:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770658204; x=1771263004;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eh+M4VSFIkbktVgGGx3VeQOuqKW8wSmllwbrE2OANM=;
        b=pwO8XvMjZYjQAlZpBdT+XeaVIkwInnMrwAM9EzeoIU+co5XUXGQUi2+QKjt1twbUwS
         DZWU3wJXmX1IMNHUGZkvtdIyYbFikyOtBrlFM5YbojykG6QhG6SivPn9uPDp/E2N4dka
         s8daoJ8oy9Itg8bvweWPyvP9QHgP8QSttODULdl3UCxDDg/Kee/eHGPqeqPWflZm8sE+
         /B0/R2yUD5K4XUWL0y11t+2jaMD1qH03BKdRasVNO+Gw9FUUhv8UgTWoRpRpbkf8HW6T
         PHPxfU9vIM7WAIFwqVZ4m0XIx7LsdZc3iXDw/WGTAYtUyDPa+Ej+/ZLsbTc6Rl0TcBgH
         7kpA==
X-Forwarded-Encrypted: i=1; AJvYcCXzI5CeDgr6/2qIUqJLAwecZIE0UL4jIU9EfYOKkffoy3fn3jA9Ayh1OAsTLHqVklK5N0guOVi0zgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkCNGx6lLrTGMgttkVzYy5+17gGAVGc3xQ4a+zPyqxWTT2Q9A
	0XMs/qaFXEusoyXeP1Fe/LAH64t5u58uFU6+/NmQ4N+2AncCPK2v6L/4FUQu1G+mde7ujBVECox
	NIVgn5y+Ow3Oza82DY7SBtzxio/JIXiKoA2W7mFqnL5hHdKEwbMdYvU6X8PI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:151d:b0:663:42d:6264 with SMTP id
 006d021491bc7-66d0c94e10fmr5802033eaf.62.1770658203810; Mon, 09 Feb 2026
 09:30:03 -0800 (PST)
Date: Mon, 09 Feb 2026 09:30:03 -0800
In-Reply-To: <738614c5-fe8a-450e-a3eb-8a5849298c90@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698a199b.050a0220.3b3015.007c.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com

Tested on:

commit:         da87d45b usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14e5465a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15261b22580000

Note: testing is done by a robot and is best-effort only.

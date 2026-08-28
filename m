Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6A357CFA
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923564; cv=none; b=Ds+FvHRFykfrLYwDsmpu/90H9cpd0VsjRN1Xtxepgg3rN4QrBht/DeEK1y6hr1T+OFciij8JDc3n9Pq+iFEBAKT4Dv3jIExTKlrsVwpF8B1TnsZE7JrotVCICc6MGPZhtX+ysvFph/1p3OGj7g1bc/XEGjuYjQK4Rz9w9a6i7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923564; c=relaxed/simple;
	bh=NIuv6od53DRf2oVKSqrVBaibQdZOjEOaUZk9OXQcI+k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sezAt7BnhKPny/OZaYOYC2ZufqjXlRXgeY6beZTGsVEWyrPrkUgXLxZU2Vz0UWzNcL7rJr0k/7gS157nMsOjDGWpcfUabdeJCSYLngEo+13xki88QkmUkkJDIEmFkrH4jQVt45/Qv8NasN6SC67edXIsN3+9yMMvNMXTwBFfVsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d9206f8so530496b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 06:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923562; x=1788528362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjgTeM0Onmo3J23ctw8YBEh9xQmtBdt9GZyqCaE/QF0=;
        b=GUOa+LROkPnkx8TLNuW3+DVga9TnHjS+WfqaJUN8eHIe6wG/WB3TRAYY70jNEkksxm
         BV4mnIzCXGmFKzyDzW/ih2d717QIO8vxWPxyEb92QnFqVhAH2B4LguFQORFkYaeVzDpA
         UA8C7r95SxuwK9f+yxeo9X3byZnMP5x1yJ+AYap5cceEI/kZ7ifsU+arRHPsv3vRfVi1
         Ifj0hP2HYnbgrK+8twQceC1hq+/RIhSxPsh542OK7Mtsgnclg/vY+UcVf9V6Ipn1/774
         Md1jYHEjgRKOmKp67YCkCQGMm08nGe+hgq9lbO5sm70eub1KY7VmyFm89A3h5sraQSZi
         W3qw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ZYIYdZKNJrOgeOKnOFKRntO90keEt3saWMLjq5o1RadQY6JIPPzr+W7cHKBWWNFNqWt4cvOIRew=@vger.kernel.org
X-Gm-Message-State: AFuF++m+rQfEuFZv0E72oAYYY2aLIF36AaH00s295s1CQgi8mSjrIxkO
	mZjj0fuIvJKYC7W5txUZB2SskM0zw/Cn38lX+EF/Vd8lrAvNyr6jvNy/Houp8B7Epd/myuM0h8G
	ksVhYGazakwQB2F3pnrds8uaVbFImjo6DfoOcTtQz44mRh3SwqU5vxJ9tEfU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:318c:b0:4b1:bc2e:3f60 with SMTP id
 5614622812f47-4b398299c26mr6853171b6e.16.1787923562532; Fri, 28 Aug 2026
 06:26:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 06:26:02 -0700
In-Reply-To: <6a802643.9ebadd4d.20b15e.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a918c6a.27659fcc.2ceef7.001a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING: ODEBUG bug in corsair_remove
From: syzbot <syzbot+0a031a76585d1c7e737d@syzkaller.appspotmail.com>
To: bentiss@kernel.org, ccc194101@163.com, chenchangcheng@kylinos.cn, 
	jeffinphilip14@gmail.com, jikos@kernel.org, jkosina@suse.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit eb51c9f8cb4f064981d9c6cae13de8eda280785d
Author: Chen Changcheng <chenchangcheng@kylinos.cn>
Date:   Mon Jul 27 01:35:00 2026 +0000

    HID: corsair: cancel worker before unregistering LED to fix use-after-free

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12580379580000
start commit:   73e3f0710014 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11580379580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16580379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9efed59cf70d6280
dashboard link: https://syzkaller.appspot.com/bug?extid=0a031a76585d1c7e737d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e6e579580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e4ed49580000

Reported-by: syzbot+0a031a76585d1c7e737d@syzkaller.appspotmail.com
Fixes: eb51c9f8cb4f ("HID: corsair: cancel worker before unregistering LED to fix use-after-free")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

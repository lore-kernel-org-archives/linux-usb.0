Received: from smtpfallback04.a1.net (smtpfallback04.a1.net [194.48.128.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1E40D574
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.48.128.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186099; cv=none; b=LUVR4BW5nJy8vuSDo+JgmBEaScHne5R72AttoncKlw4MMVOK1txqJuLn3ETUWzeBVvdFMrKPQcIA7ot1duW5qdoPkq/f6wi9gwPSZeCkG1Vw3K2bwEN5K79RkwkBgVUJ5YqHKTf/c5qbHpKV0q75ak8JZuQH3Ox12woTq8QJ+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186099; c=relaxed/simple;
	bh=A32Kqt/fP8EKy4wf2gIwnRIXLpycJA+wo7scyfqL3EI=;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=aIJPRQ4iUikOhwd966oxI6LnC/etm4cNxX1gZG/qvX4BeQMRHS0cbUqGJ8EsXp29q7+mStj1Y2poOrcdZ9a1/6dZVvmw76FzYI2CZ5wbH0LErKlSIO9Bo2cYqI8q0DVLQ4x9qiRlKjnMV3ThV5ZvTfIlWqY8QteH9MCG5HYo+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=Txrqyuz3; arc=none smtp.client-ip=194.48.128.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="Txrqyuz3"
Received: from smtpout20.a1.net (unknown [10.247.84.23])
	by smtpfallback04.a1.net (Postfix) with ESMTPS id 4hqkr76244zYklK9
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:44:55 +0200 (CEST)
Received: from [192.168.0.6] (unknown [100.78.19.185])
	by smtpout20.a1.net (Postfix) with ESMTPSA id 4hqkqy1X0PzGrqnx
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790185486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mAh4lk/27E28hpjyOzVdM77JoiLCDjvXOLKsnbwFVrI=;
	b=Txrqyuz37brI5oDE8DNZikZetNat81BQwjLNR0Fme+nhNMIFHSK8+MstrIZSl0YjEQO06v
	G3hP0E/uLRV7sIkq2lCsO4qbxLo0AaQPLmI1cc/Eu4qb/fLTmZWEOxVBtYMR8wtP1dj/tm
	X8bA1xeJVg9KJk5vIEsuxyjcs5ww0CLFQeyLe2yejSiiHVfZsosixPKS/fraol/2MamC3S
	jV4zrzIZaoTT0bijQHcA+PXdJuyMHl0jfSHBYd7J0DrmurNjPmSxOLzz4DUKnJhZ0caPVj
	uZdIMjbC0tYIOB6cQf9fM++HPhn6KpHqtybaJW+Ps89Ngf21oN3KRyHWsyz20+vWiTajpT
	FFUR1JD4uHjQEO8jYdFA8LYLVOr25wkl8xnX+VYY2hLiDuewvh+aVvNRpw6CC1q8EniHSw
	aLMRPA1gGjIynKkUfeByx2FJV3FiRBekjlj+1kOLPkDmd1xlipuEySjNuVViqLKtFpHism
	uAvyuZVHH+X/pFxLA63nKYpKQtTzxTfNPuFKvZ9HATkWO1XeDjRWNJxtf5oXvlWDfmHGVZ
	t5jB+LO6sk2mz6OE0v+tYRgD7yLoXbUI9Nx1Qt6MUZw/e47oIBExyktncm5O9dEwDx0iTS
	fUXQ0WFHuAYf7Hp2Q3u5hcMlZmRa6VLX97lkAm7EV2JiaNxp+o+aM=
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Subject: possible regression in usb-storage?
Message-ID: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
Date: Wed, 23 Sep 2026 19:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 

Good evening,

on a 6.9.9-686 kernel I get a
failing log:

> [14053.748372] usb 1-6: new high-speed USB device number 4 using ehci-pci
> [14053.945440] usb 1-6: New USB device found, idVendor=0bc2, idProduct=2039, bcdDevice=19.01
> [14053.946938] usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [14053.948390] usb 1-6: Product: Expansion SW
> [14053.949824] usb 1-6: Manufacturer: Seagate
> [14053.951194] usb 1-6: SerialNumber: 00000000NACD256B
> [14053.953484] scsi host5: uas
> [14053.955698] scsi 5:0:0:0: Direct-Access     Seagate  Expansion SW     1901 PQ: 0 ANSI: 6
> [14053.962246] sd 5:0:0:0: Attached scsi generic sg2 type 0
> [14114.264385] udevd[395]: worker [5894] /devices/pci0000:00/0000:00:1d.7/usb1/1-6/1-6:1.0/host5/target5:0:0/5:0:0:0 is taking a long time
> [14122.158683] sd 5:0:0:0: [sdc] Spinning up disk...

it hangs here and makes weird noises. I disconnect it.

> [14143.232377] .
> [14178.284046] usb 1-6: USB disconnect, device number 4
> [14178.287138] sd 5:0:0:0: [sdc] tag#10 uas_zap_pending 0 uas-tag 1 inflight: CMD.
> [14178.288510] sd 5:0:0:0: [sdc] tag#10 CDB: Test Unit Ready 00 00 00 00 00 00
> [14178.289918] not responding...
> [14178.291273] sd 5:0:0:0: [sdc] Read Capacity(16) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [14178.292611] sd 5:0:0:0: [sdc] Sense not available.
> [14178.293910] sd 5:0:0:0: [sdc] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [14178.295177] sd 5:0:0:0: [sdc] Sense not available.
> [...]

disabling the uas driver as suggested on various fora does not help:

> [  221.378596] usb 1-5: new high-speed USB device number 6 using ehci-pci
> [  221.579691] usb 1-5: New USB device found, idVendor=0bc2, idProduct=2039, bcdDevice=19.01
> [  221.579695] usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  221.579698] usb 1-5: Product: Expansion SW
> [  221.579700] usb 1-5: Manufacturer: Seagate
> [  221.579701] usb 1-5: SerialNumber: 00000000NACD256B
> [  221.580397] usb 1-5: UAS is ignored for this device, using usb-storage instead
> [  221.580401] usb-storage 1-5:1.0: USB Mass Storage device detected
> [  221.580498] usb-storage 1-5:1.0: Quirks match for vid 0bc2 pid 2039: 800000
> [  221.580527] scsi host5: usb-storage 1-5:1.0
> [  222.587483] scsi 5:0:0:0: Direct-Access     Seagate  Expansion SW     1901 PQ: 0 ANSI: 6
> [  222.587795] sd 5:0:0:0: Attached scsi generic sg3 type 0
...here things hang. I disconnect..
> [  241.743514] usb 1-5: USB disconnect, device number 6
> [  241.758624] sd 5:0:0:0: [sdd] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  241.758627] sd 5:0:0:0: [sdd] Sense not available.
> [  241.758634] sd 5:0:0:0: [sdd] 0 512-byte logical blocks: (0 B/0 B)
> [  241.758637] sd 5:0:0:0: [sdd] 0-byte physical blocks
> [  241.758642] sd 5:0:0:0: [sdd] Write Protect is off
> [  241.758644] sd 5:0:0:0: [sdd] Mode Sense: 00 00 00 00
> [  241.758649] sd 5:0:0:0: [sdd] Asking for cache data failed
> [  241.759589] sd 5:0:0:0: [sdd] Assuming drive cache: write through
> [  241.759880] sd 5:0:0:0: [sdd] Attached SCSI disk
> [  241.975904] udevd[4761]: inotify_add_watch(7, /dev/sdd, 10) failed: No such file or directory



on a 3.16 kernel on a different box it works. I have:

> usb 4-7: new high speed USB device using ehci_hcd and address 2
> usb 4-7: new device found, idVendor=0bc2, idProduct=2039
> usb 4-7: new device strings: Mfr=1, Product=2, SerialNumber=3
> usb 4-7: Product: Expansion SW
> usb 4-7: Manufacturer: Seagate
> usb 4-7: SerialNumber: 00000000NACD256B
> usb 4-7: configuration #1 chosen from 1 choice
> Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> Initializing USB Mass Storage driver...
> scsi4 : SCSI emulation for USB Mass Storage devices
> usb-storage: device found at 2
> usb-storage: waiting for device to settle before scanning
> usbcore: registered new interface driver usb-storage
> USB Mass Storage support registered.
> scsi 4:0:0:0: Direct-Access     Seagate  Expansion SW     1901 PQ: 0 ANSI: 6
> sd 4:0:0:0: [sdb] 1953525167 512-byte hardware sectors (1000205 MB)
> sd 4:0:0:0: [sdb] Write Protect is off
> sd 4:0:0:0: [sdb] Mode Sense: 47 00 00 08
> sd 4:0:0:0: [sdb] Assuming drive cache: write through
> sd 4:0:0:0: [sdb] 1953525167 512-byte hardware sectors (1000205 MB)
> sd 4:0:0:0: [sdb] Write Protect is off
> sd 4:0:0:0: [sdb] Mode Sense: 47 00 00 08
> sd 4:0:0:0: [sdb] Assuming drive cache: write through
>  sdb: sdb1
> sd 4:0:0:0: [sdb] Attached SCSI disk
> sd 4:0:0:0: Attached scsi generic sg2 type 0
> usb-storage: device scan complete


with a kernel 4.9.0-0.bpo.12-686-pae
log (with uas):
> [  143.348022] usb 1-7: new high-speed USB device number 2 using ehci-pci
> [  143.561192] usb 1-7: New USB device found, idVendor=0bc2, idProduct=2039
> [  143.561198] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  143.561201] usb 1-7: Product: Expansion SW
> [  143.561204] usb 1-7: Manufacturer: Seagate
> [  143.561206] usb 1-7: SerialNumber: 00000000NACD256B
> [  143.801335] usbcore: registered new interface driver usb-storage
> [  143.818228] scsi host4: uas
> [  143.818463] usbcore: registered new interface driver uas
> [  143.820344] scsi 4:0:0:0: Direct-Access     Seagate  Expansion SW     1901 PQ: 0 ANSI: 6
> [  143.822455] sd 4:0:0:0: Attached scsi generic sg3 type 0
> [  146.464493] sd 4:0:0:0: [sdc] 1953525167 512-byte logical blocks: (1.00 TB/932 GiB)
> [  146.464501] sd 4:0:0:0: [sdc] 4096-byte physical blocks
> [  146.465591] sd 4:0:0:0: [sdc] Write Protect is off
> [  146.465596] sd 4:0:0:0: [sdc] Mode Sense: 53 00 00 08
> [  146.466216] sd 4:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [  146.466592] sd 4:0:0:0: [sdc] Optimal transfer size 33553920 bytes not a multiple of physical block size (4096 bytes)
> [  146.679941]  sdc: sdc1
> [  146.683219] sd 4:0:0:0: [sdc] Attached SCSI disk

detection and mounting works ok, but the disk buzzes all the time..

mount and ls look ok.
> [  223.403981] EXT4-fs (sdc1): mounting ext3 file system using the ext4 subsystem
> [  224.337602] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: (null)

but on disconnect(after umount):

> [  290.721391] usb 1-7: USB disconnect, device number 2
> [  290.723067] sd 4:0:0:0: [sdc] Synchronizing SCSI cache
> [  290.960040] sd 4:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK

It seems it failed sometime around this version. Linux hardware 
compatibility lists on the internet suggests the hard disk is supported 
since 2.6something.

I tried to set usbfs_snoop in the sysfs and the kernel commandline,
but I don't get any more output.

usually I unplugged after around 20 sec hangs. if I don't do that, the 
kernel will eventually kill the worker thread and later udevd:

> Sep 23 11:47:00  daemon.err kernel: [  233.849695] udevd[400]: worker [4800] /devices/pci0000:00/0000:00:1d.7/usb1/1-5/1-5:1.0/host5/target5:0:0/5:0:0:0 timeout; kill it
> Sep 23 11:47:00  daemon.err kernel: [  233.851646] udevd[400]: seq 2026 '/devices/pci0000:00/0000:00:1d.7/usb1/1-5/1-5:1.0/host5/target5:0:0/5:0:0:0' killed
> Sep 23 11:47:09  kern.err kernel: [  242.874627] INFO: task udevd:4800 blocked for more than 120 seconds.
> Sep 23 11:47:09  kern.err kernel: [  242.874662]       Not tainted 6.9.9-686 #1 Debian 6.9.9-1
> Sep 23 11:47:09  kern.err kernel: [  242.874684] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Sep 23 11:47:09  kern.info kernel: [  242.874711] task:udevd           state:D stack:0     pid:4800  tgid:4800  ppid:400    flags:0x00000006
> Sep 23 11:47:09  kern.info kernel: [  242.874748] Call Trace:
> Sep 23 11:47:09  kern.info kernel: [  242.874764]  __schedule+0x406/0xb6c
> Sep 23 11:47:09  kern.info kernel: [  242.874786]  schedule+0x25/0x10c
> Sep 23 11:47:09  kern.info kernel: [  242.874803]  schedule_preempt_disabled+0x14/0x20
> Sep 23 11:47:09  kern.info kernel: [  242.874824]  __mutex_lock.constprop.0+0x315/0x644
> Sep 23 11:47:09  kern.info kernel: [  242.874846]  __mutex_lock_slowpath+0x12/0x14
> Sep 23 11:47:09  kern.info kernel: [  242.874866]  mutex_lock+0x2f/0x34
> Sep 23 11:47:09  kern.info kernel: [  242.874883]  uevent_show+0x7a/0xf4
> Sep 23 11:47:09  kern.info kernel: [  242.874902]  ? _dev_info+0x4c/0x4c
> Sep 23 11:47:09  kern.info kernel: [  242.874920]  ? device_match_any+0x10/0x10
> Sep 23 11:47:09  kern.info kernel: [  242.874938]  dev_attr_show+0x18/0x4c
> Sep 23 11:47:09  kern.info kernel: [  242.874956]  sysfs_kf_seq_show+0x96/0xf8
> Sep 23 11:47:09  kern.info kernel: [  242.874977]  kernfs_seq_show+0x23/0x28
> Sep 23 11:47:09  kern.info kernel: [  242.874995]  seq_read_iter+0x196/0x484
> Sep 23 11:47:09  kern.info kernel: [  242.875014]  ? __do_fast_syscall_32+0x72/0xc0
> Sep 23 11:47:09  kern.info kernel: [  242.875035]  kernfs_fop_read_iter+0x11b/0x188
> Sep 23 11:47:09  kern.info kernel: [  242.875054]  ? rw_verify_area+0x49/0x124
> Sep 23 11:47:09  kern.info kernel: [  242.875075]  ? kernfs_vma_page_mkwrite+0x70/0x70
> Sep 23 11:47:09  kern.info kernel: [  242.875096]  vfs_read+0x270/0x368
> Sep 23 11:47:09  kern.info kernel: [  242.875114]  ksys_read+0x69/0xd8
> Sep 23 11:47:09  kern.info kernel: [  242.875132]  __ia32_sys_read+0x15/0x18
> Sep 23 11:47:09  kern.info kernel: [  242.875150]  ia32_sys_call+0x19e8/0x21a8
> Sep 23 11:47:09  kern.info kernel: [  242.875170]  __do_fast_syscall_32+0x68/0xc0
> Sep 23 11:47:09  kern.info kernel: [  242.875189]  ? irqentry_exit_to_user_mode+0x65/0x168
> Sep 23 11:47:09  kern.info kernel: [  242.875212]  do_fast_syscall_32+0x29/0x60
> Sep 23 11:47:09  kern.info kernel: [  242.875231]  do_SYSENTER_32+0x15/0x18
> Sep 23 11:47:09  kern.info kernel: [  242.875248]  entry_SYSENTER_32+0x98/0xf8
> Sep 23 11:47:09  kern.info kernel: [  242.875268] EIP: 0xb7f6b579
> Sep 23 11:47:09  kern.info kernel: [  242.875283] EAX: ffffffda EBX: 00000008 ECX: 012e2430 EDX: 00001000
> Sep 23 11:47:09  kern.info kernel: [  242.875308] ESI: b7e83e34 EDI: b7e837a8 EBP: bfe43d58 ESP: bfe43cf0
> Sep 23 11:47:09  kern.info kernel: [  242.875331] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00200246
> Sep 23 11:48:07  kern.warn kernel: [  300.922607] .not responding...
> 
> Sep 23 11:49:10  kern.err kernel: [  363.706632] INFO: task udevd:4800 blocked for more than 241 seconds.
> Sep 23 11:49:10  kern.err kernel: [  363.706665]       Not tainted 6.9.9-686 #1 Debian 6.9.9-1
> Sep 23 11:49:10  kern.err kernel: [  363.707717] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Sep 23 11:49:10  kern.info kernel: [  363.708768] task:udevd           state:D stack:0     pid:4800  tgid:4800  ppid:400    flags:0x00000006
> Sep 23 11:49:10  kern.info kernel: [  363.709808] Call Trace:
> Sep 23 11:49:10  kern.info kernel: [  363.710824]  __schedule+0x406/0xb6c
> Sep 23 11:49:10  kern.info kernel: [  363.711854]  schedule+0x25/0x10c
> Sep 23 11:49:10  kern.info kernel: [  363.712852]  schedule_preempt_disabled+0x14/0x20
> Sep 23 11:49:10  kern.info kernel: [  363.713853]  __mutex_lock.constprop.0+0x315/0x644
> Sep 23 11:49:10  kern.info kernel: [  363.714856]  __mutex_lock_slowpath+0x12/0x14
> Sep 23 11:49:10  kern.info kernel: [  363.715838]  mutex_lock+0x2f/0x34
> Sep 23 11:49:10  kern.info kernel: [  363.716801]  uevent_show+0x7a/0xf4
> Sep 23 11:49:10  kern.info kernel: [  363.717761]  ? _dev_info+0x4c/0x4c
> Sep 23 11:49:10  kern.info kernel: [  363.718716]  ? device_match_any+0x10/0x10
> Sep 23 11:49:10  kern.info kernel: [  363.719666]  dev_attr_show+0x18/0x4c
> Sep 23 11:49:10  kern.info kernel: [  363.720613]  sysfs_kf_seq_show+0x96/0xf8
> Sep 23 11:49:10  kern.info kernel: [  363.721560]  kernfs_seq_show+0x23/0x28
> Sep 23 11:49:10  kern.info kernel: [  363.722489]  seq_read_iter+0x196/0x484
> Sep 23 11:49:10  kern.info kernel: [  363.723412]  ? __do_fast_syscall_32+0x72/0xc0
> Sep 23 11:49:10  kern.info kernel: [  363.724328]  kernfs_fop_read_iter+0x11b/0x188
> Sep 23 11:49:10  kern.info kernel: [  363.725227]  ? rw_verify_area+0x49/0x124
> Sep 23 11:49:10  kern.info kernel: [  363.726118]  ? kernfs_vma_page_mkwrite+0x70/0x70
> Sep 23 11:49:10  kern.info kernel: [  363.727007]  vfs_read+0x270/0x368
> Sep 23 11:49:10  kern.info kernel: [  363.727896]  ksys_read+0x69/0xd8
> Sep 23 11:49:10  kern.info kernel: [  363.728773]  __ia32_sys_read+0x15/0x18
> Sep 23 11:49:10  kern.info kernel: [  363.729645]  ia32_sys_call+0x19e8/0x21a8
> Sep 23 11:49:10  kern.info kernel: [  363.730520]  __do_fast_syscall_32+0x68/0xc0
> Sep 23 11:49:10  kern.info kernel: [  363.731398]  ? irqentry_exit_to_user_mode+0x65/0x168
> Sep 23 11:49:10  kern.info kernel: [  363.732278]  do_fast_syscall_32+0x29/0x60
> Sep 23 11:49:10  kern.info kernel: [  363.733149]  do_SYSENTER_32+0x15/0x18
> Sep 23 11:49:10  kern.info kernel: [  363.734008]  entry_SYSENTER_32+0x98/0xf8
> Sep 23 11:49:10  kern.info kernel: [  363.734868] EIP: 0xb7f6b579
> Sep 23 11:49:10  kern.info kernel: [  363.735719] EAX: ffffffda EBX: 00000008 ECX: 012e2430 EDX: 00001000
> Sep 23 11:49:10  kern.info kernel: [  363.736586] ESI: b7e83e34 EDI: b7e837a8 EBP: bfe43d58 ESP: bfe43cf0
> Sep 23 11:49:10  kern.info kernel: [  363.737445] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00200246
> 

